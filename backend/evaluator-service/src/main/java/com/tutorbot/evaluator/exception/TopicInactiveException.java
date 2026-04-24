package com.tutorbot.evaluator.exception;

public class TopicInactiveException extends RuntimeException {

    public TopicInactiveException(Long topicId) {
        super("Topic is inactive: " + topicId);
    }
}