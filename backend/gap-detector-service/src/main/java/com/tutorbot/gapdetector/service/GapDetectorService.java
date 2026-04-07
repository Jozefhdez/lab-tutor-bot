package com.tutorbot.gapdetector.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tutorbot.gapdetector.dto.GapDetectionRequest;
import com.tutorbot.gapdetector.dto.GapMapper;
import com.tutorbot.gapdetector.dto.GapResponse;
import com.tutorbot.gapdetector.model.LearningGap;
import com.tutorbot.gapdetector.ollama.OllamaService;
import com.tutorbot.gapdetector.repository.LearningGapRepository;

@Service
public class GapDetectorService {

    private static final Logger log = LoggerFactory.getLogger(GapDetectorService.class);
    private static final ObjectMapper objectMapper = new ObjectMapper();

    private final LearningGapRepository learningGapRepository;
    private final OllamaService ollamaService;

    public GapDetectorService(LearningGapRepository learningGapRepository,
            OllamaService ollamaService) {
        this.learningGapRepository = learningGapRepository;
        this.ollamaService = ollamaService;
    }

    public List<GapResponse> findAll() {
        return learningGapRepository.findAll().stream()
                .map(GapMapper::toResponse)
                .toList();
    }

    public GapResponse findById(Long id) {
        return learningGapRepository.findById(id)
                .map(GapMapper::toResponse)
                .orElseThrow(() -> new IllegalArgumentException("Gap not found: " + id));
    }

    public List<GapResponse> findByStudentId(String studentId) {
        return learningGapRepository.findByStudentId(studentId).stream()
                .map(GapMapper::toResponse)
                .toList();
    }

    public List<GapResponse> findUnresolvedByStudent(String studentId) {
        return learningGapRepository.findByStudentIdAndResolved(studentId, false).stream()
                .map(GapMapper::toResponse)
                .toList();
    }

    @Transactional
    public GapResponse createGap(GapDetectionRequest request) {
        LearningGap entity = GapMapper.toEntity(request);
        entity.setDetectedAt(LocalDateTime.now());
        LearningGap saved = learningGapRepository.save(entity);
        log.info("Gap created id={} student={} concept={}", saved.getId(), saved.getStudentId(), saved.getConcept());
        return GapMapper.toResponse(saved);
    }

    @Transactional
    public GapResponse resolveGap(Long id) {
        LearningGap gap = learningGapRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Gap not found: " + id));
        gap.setResolved(true);
        LearningGap saved = learningGapRepository.save(gap);
        log.info("Gap resolved id={}", id);
        return GapMapper.toResponse(saved);
    }

    @Transactional
    public List<GapResponse> analyzeFromEvaluation(String studentId, Long topicId,
            int score, int maxScore, String feedback) {
        log.info("Analyzing gaps for student={} topic={} score={}/{}", studentId, topicId, score, maxScore);

        double percent = maxScore > 0 ? (double) score / maxScore * 100 : 0;
        if (percent >= 70) {
            log.info("Score {}% is above gap threshold, no gaps detected", percent);
            return List.of();
        }

        String evaluationSummary = "Topic ID: %d, Score: %d/%d (%.0f%%), Feedback: %s"
                .formatted(topicId, score, maxScore, percent, feedback);

        String ollamaResponse = ollamaService.analyzeGaps(studentId, evaluationSummary);
        return parseAndSaveGaps(studentId, topicId, ollamaResponse);
    }

    private List<GapResponse> parseAndSaveGaps(String studentId, Long topicId, String ollamaResponse) {
        try {
            List<Map<String, Object>> gaps = objectMapper.readValue(ollamaResponse, new TypeReference<>() {
            });
            return gaps.stream().map(gapMap -> {
                LearningGap entity = new LearningGap();
                entity.setStudentId(studentId);
                entity.setTopicId(topicId);
                entity.setConcept(String.valueOf(gapMap.getOrDefault("concept", "Unknown")));
                entity.setSeverity(String.valueOf(gapMap.getOrDefault("severity", "MEDIUM")));
                Object conf = gapMap.get("confidence");
                entity.setConfidence(conf instanceof Number n ? n.doubleValue() : 0.5);
                entity.setDetectedAt(LocalDateTime.now());
                entity.setResolved(false);
                return GapMapper.toResponse(learningGapRepository.save(entity));
            }).toList();
        } catch (Exception e) {
            log.warn("Could not parse Ollama gap analysis, creating single gap entry: {}", e.getMessage());
            LearningGap fallback = new LearningGap();
            fallback.setStudentId(studentId);
            fallback.setTopicId(topicId);
            fallback.setConcept("Análisis pendiente");
            fallback.setSeverity("MEDIUM");
            fallback.setConfidence(0.5);
            fallback.setDetectedAt(LocalDateTime.now());
            fallback.setResolved(false);
            return List.of(GapMapper.toResponse(learningGapRepository.save(fallback)));
        }
    }
}
