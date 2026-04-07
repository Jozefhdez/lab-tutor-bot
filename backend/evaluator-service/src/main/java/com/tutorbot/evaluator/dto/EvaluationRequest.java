package com.tutorbot.evaluator.dto;

public record EvaluationRequest(
        String sessionId,
        String studentId,
        String questionText,
        String studentAnswer,
        String correctAnswer,
        Integer maxScore,
        Long topicId) {

}
