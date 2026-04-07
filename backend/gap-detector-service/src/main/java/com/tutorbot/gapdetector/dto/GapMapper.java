package com.tutorbot.gapdetector.dto;

import com.tutorbot.gapdetector.model.LearningGap;

public final class GapMapper {

    private GapMapper() {
    }

    public static GapResponse toResponse(LearningGap entity) {
        return new GapResponse(
                entity.getId(),
                entity.getStudentId(),
                entity.getTopicId(),
                entity.getSubtopicId(),
                entity.getConcept(),
                entity.getSeverity(),
                entity.getConfidence(),
                entity.getDetectedAt(),
                entity.getResolved());
    }

    public static LearningGap toEntity(GapDetectionRequest request) {
        var entity = new LearningGap();
        entity.setStudentId(request.studentId());
        entity.setTopicId(request.topicId());
        entity.setSubtopicId(request.subtopicId());
        entity.setConcept(request.concept());
        entity.setSeverity(request.severity() != null ? request.severity() : "MEDIUM");
        entity.setConfidence(request.confidence());
        entity.setResolved(false);
        return entity;
    }
}
