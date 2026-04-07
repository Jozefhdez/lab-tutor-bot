package com.tutorbot.evaluator.dto;

import com.tutorbot.evaluator.model.EvaluationResult;

public final class EvaluationMapper {

    private EvaluationMapper() {
    }

    public static EvaluationResponse toResponse(EvaluationResult entity) {
        return new EvaluationResponse(
                entity.getId(),
                entity.getSessionId(),
                entity.getStudentId(),
                entity.getQuestionText(),
                entity.getStudentAnswer(),
                entity.getScore(),
                entity.getMaxScore(),
                entity.getFeedbackSummary(),
                entity.getTopicId(),
                entity.getEvaluatedAt());
    }

    public static EvaluationResult toEntity(EvaluationRequest request) {
        var entity = new EvaluationResult();
        entity.setSessionId(request.sessionId());
        entity.setStudentId(request.studentId());
        entity.setQuestionText(request.questionText());
        entity.setStudentAnswer(request.studentAnswer());
        entity.setCorrectAnswer(request.correctAnswer());
        entity.setMaxScore(request.maxScore() != null ? request.maxScore() : 100);
        entity.setTopicId(request.topicId());
        return entity;
    }
}
