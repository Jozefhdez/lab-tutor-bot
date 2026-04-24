package com.tutorbot.evaluator.exception;

public class StudentNotEnrolledException extends RuntimeException {

    public StudentNotEnrolledException(String studentId, Long topicId) {
        super("Student " + studentId + " is not enrolled in topic " + topicId);
    }
}