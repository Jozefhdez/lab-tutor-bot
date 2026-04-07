package com.tutorbot.evaluator.dto;

import java.time.LocalDateTime;

public record EvaluationResponse(
        Long id,
        String sessionId,
        String studentId,
        String questionText,
        String studentAnswer,
        Integer score,
        Integer maxScore,
        String feedbackSummary,
        Long topicId,
        LocalDateTime evaluatedAt) {

}
