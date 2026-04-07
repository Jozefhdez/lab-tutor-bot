package com.tutorbot.gapdetector.event;

import java.io.Serializable;

public record GapDetectedEvent(
        Long gapId,
        String studentId,
        String concept,
        String severity,
        Double confidence,
        Long topicId) implements Serializable {

}
