package com.tutorbot.evaluator.event;

import java.io.Serializable;

public record StudentAnsweredEvent(
        String sessionId,
        String studentId,
        String questionText,
        String studentAnswer,
        String correctAnswer,
        Integer maxScore,
        Long topicId) implements Serializable {

}
