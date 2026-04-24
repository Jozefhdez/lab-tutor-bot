package com.tutorbot.evaluator.service;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tutorbot.evaluator.dto.EvaluationMapper;
import com.tutorbot.evaluator.dto.EvaluationRequest;
import com.tutorbot.evaluator.dto.EvaluationResponse;
import com.tutorbot.evaluator.model.EvaluationResult;
import com.tutorbot.evaluator.ollama.OllamaService;
import com.tutorbot.evaluator.repository.EvaluationResultRepository;

@Service
public class EvaluationService {

    private static final Logger log = LoggerFactory.getLogger(EvaluationService.class);
    private static final ObjectMapper objectMapper = new ObjectMapper();

    private final EvaluationResultRepository evaluationResultRepository;
    private final OllamaService ollamaService;
    private final EvaluationGuardService guard;

    public EvaluationService(EvaluationResultRepository evaluationResultRepository,
         OllamaService ollamaService,
         EvaluationGuardService guard
    ) {
        this.evaluationResultRepository = evaluationResultRepository;
        this.ollamaService = ollamaService;
        this.guard = guard;
    }

    public List<EvaluationResponse> findAll() {
        return evaluationResultRepository.findAll().stream()
                .map(EvaluationMapper::toResponse)
                .toList();
    }

    public EvaluationResponse findById(Long id) {
        return evaluationResultRepository.findById(id)
                .map(EvaluationMapper::toResponse)
                .orElseThrow(() -> new IllegalArgumentException("Evaluation not found: " + id));
    }

    public List<EvaluationResponse> findByStudentId(String studentId) {
        return evaluationResultRepository.findByStudentId(studentId).stream()
                .map(EvaluationMapper::toResponse)
                .toList();
    }

    public List<EvaluationResponse> findBySessionId(String sessionId) {
        return evaluationResultRepository.findBySessionId(sessionId).stream()
                .map(EvaluationMapper::toResponse)
                .toList();
    }

    @Transactional
    public EvaluationResponse evaluate(EvaluationRequest request) {
        guard.validate(request.studentId(), request.topicId());

        log.info("Evaluating answer for student={} session={}", request.studentId(), request.sessionId());

        EvaluationResult entity = EvaluationMapper.toEntity(request);
        entity.setEvaluatedAt(LocalDateTime.now());

        // Call Ollama for AI-powered evaluation
        String ollamaResponse = ollamaService.evaluate(
                request.questionText(), request.studentAnswer(), request.correctAnswer());

        parseOllamaScore(ollamaResponse, entity);

        EvaluationResult saved = evaluationResultRepository.save(entity);
        log.info("Evaluation saved id={} score={}/{}", saved.getId(), saved.getScore(), saved.getMaxScore());

        return EvaluationMapper.toResponse(saved);
    }

    @Transactional
    public EvaluationResponse save(EvaluationResult evaluationResult) {
        EvaluationResult saved = evaluationResultRepository.save(evaluationResult);
        return EvaluationMapper.toResponse(saved);
    }

    private void parseOllamaScore(String ollamaResponse, EvaluationResult entity) {
        try {
            JsonNode json = objectMapper.readTree(ollamaResponse);
            int rawScore = json.path("score").asInt(0);
            // Normalize to maxScore scale
            int maxScore = entity.getMaxScore() != null ? entity.getMaxScore() : 100;
            entity.setScore(Math.min(rawScore, maxScore));
            entity.setFeedbackSummary(json.path("feedback").asText("Sin retroalimentación disponible."));
        } catch (Exception e) {
            log.warn("Could not parse Ollama JSON response, using raw text as feedback: {}", e.getMessage());
            entity.setScore(0);
            entity.setFeedbackSummary(ollamaResponse);
        }
    }
}
