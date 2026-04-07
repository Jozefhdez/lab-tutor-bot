package com.tutorbot.gapdetector.dto;

public record GapDetectionRequest(
        String studentId,
        Long topicId,
        Long subtopicId,
        String concept,
        String severity,
        Double confidence) {

}
