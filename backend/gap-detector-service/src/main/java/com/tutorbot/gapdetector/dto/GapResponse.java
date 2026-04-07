package com.tutorbot.gapdetector.dto;

import java.time.LocalDateTime;

public record GapResponse(
        Long id,
        String studentId,
        Long topicId,
        Long subtopicId,
        String concept,
        String severity,
        Double confidence,
        LocalDateTime detectedAt,
        Boolean resolved) {

}
