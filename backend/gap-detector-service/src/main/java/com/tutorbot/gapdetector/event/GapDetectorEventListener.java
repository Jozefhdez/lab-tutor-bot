package com.tutorbot.gapdetector.event;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tutorbot.gapdetector.dto.GapResponse;
import com.tutorbot.gapdetector.service.GapDetectorService;

@Component
@ConditionalOnProperty(name = "tutorbot.messaging.enabled", havingValue = "true")
public class GapDetectorEventListener {

    private static final Logger log = LoggerFactory.getLogger(GapDetectorEventListener.class);

    private final GapDetectorService gapDetectorService;
    private final RabbitTemplate rabbitTemplate;
    private final ObjectMapper objectMapper;

    public GapDetectorEventListener(GapDetectorService gapDetectorService,
            RabbitTemplate rabbitTemplate,
            ObjectMapper objectMapper) {
        this.gapDetectorService = gapDetectorService;
        this.rabbitTemplate = rabbitTemplate;
        this.objectMapper = objectMapper;
    }

    @RabbitListener(queues = "evaluation.completed")
    public void onEvaluationCompleted(String message) {
        try {
            EvaluationCompletedEvent event = objectMapper.readValue(message, EvaluationCompletedEvent.class);
            log.info("Received evaluation.completed for student={} evaluationId={}",
                    event.studentId(), event.evaluationId());

            List<GapResponse> detectedGaps = gapDetectorService.analyzeFromEvaluation(
                    event.studentId(),
                    event.topicId(),
                    event.score(),
                    event.maxScore(),
                    event.feedbackSummary());

            for (GapResponse gap : detectedGaps) {
                publishGapDetected(gap);
            }

            log.info("Gap analysis complete: {} gaps detected for student={}",
                    detectedGaps.size(), event.studentId());

        } catch (Exception e) {
            log.error("Error processing evaluation.completed event: {}", e.getMessage(), e);
        }
    }

    private void publishGapDetected(GapResponse gap) {
        try {
            var event = new GapDetectedEvent(
                    gap.id(),
                    gap.studentId(),
                    gap.concept(),
                    gap.severity(),
                    gap.confidence(),
                    gap.topicId());

            String json = objectMapper.writeValueAsString(event);
            rabbitTemplate.convertAndSend("gap.detected", json);
            log.info("Published gap.detected for gapId={} concept={}", gap.id(), gap.concept());
        } catch (Exception e) {
            log.error("Failed to publish gap.detected event: {}", e.getMessage(), e);
        }
    }
}
