package com.tutorbot.evaluator.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tutorbot.evaluator.dto.EvaluationRequest;
import com.tutorbot.evaluator.dto.EvaluationResponse;
import com.tutorbot.evaluator.service.EvaluationService;

@Component
@ConditionalOnProperty(name = "tutorbot.messaging.enabled", havingValue = "true")
public class EvaluatorEventListener {

    private static final Logger log = LoggerFactory.getLogger(EvaluatorEventListener.class);

    private final EvaluationService evaluationService;
    private final RabbitTemplate rabbitTemplate;
    private final ObjectMapper objectMapper;

    public EvaluatorEventListener(EvaluationService evaluationService,
            RabbitTemplate rabbitTemplate,
            ObjectMapper objectMapper) {
        this.evaluationService = evaluationService;
        this.rabbitTemplate = rabbitTemplate;
        this.objectMapper = objectMapper;
    }

    @RabbitListener(queues = "student.answered")
    public void onStudentAnswered(String message) {
        try {
            StudentAnsweredEvent event = objectMapper.readValue(message, StudentAnsweredEvent.class);
            log.info("Received student.answered event for student={} session={}",
                    event.studentId(), event.sessionId());

            EvaluationRequest request = new EvaluationRequest(
                    event.sessionId(),
                    event.studentId(),
                    event.questionText(),
                    event.studentAnswer(),
                    event.correctAnswer(),
                    event.maxScore(),
                    event.topicId());

            EvaluationResponse result = evaluationService.evaluate(request);
            publishEvaluationCompleted(result);

        } catch (Exception e) {
            log.error("Error processing student.answered event: {}", e.getMessage(), e);
        }
    }

    private void publishEvaluationCompleted(EvaluationResponse result) {
        try {
            var event = new EvaluationCompletedEvent(
                    result.id(),
                    result.sessionId(),
                    result.studentId(),
                    result.score(),
                    result.maxScore(),
                    result.feedbackSummary(),
                    result.topicId());

            String json = objectMapper.writeValueAsString(event);
            rabbitTemplate.convertAndSend("evaluation.completed", json);
            log.info("Published evaluation.completed for evaluationId={}", result.id());
        } catch (Exception e) {
            log.error("Failed to publish evaluation.completed event: {}", e.getMessage(), e);
        }
    }
}
