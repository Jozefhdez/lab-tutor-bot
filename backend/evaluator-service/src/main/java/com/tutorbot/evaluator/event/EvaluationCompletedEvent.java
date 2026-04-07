package com.tutorbot.evaluator.event;

import java.io.Serializable;

public record EvaluationCompletedEvent(
        Long evaluationId,
        String sessionId,
        String studentId,
        Integer score,
        Integer maxScore,
        String feedbackSummary,
        Long topicId) implements Serializable {

}
