package com.tutorbot.evaluator.exception;

public class TopicNotFoundException extends RuntimeException {

    public TopicNotFoundException(Long topicId) {
        super("Topic not found: " + topicId);
    }
}