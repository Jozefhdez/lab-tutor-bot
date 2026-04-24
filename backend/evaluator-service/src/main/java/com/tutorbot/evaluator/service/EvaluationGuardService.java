package com.tutorbot.evaluator.service;

import org.springframework.stereotype.Service;

import com.tutorbot.evaluator.exception.SkillInactiveException;
import com.tutorbot.evaluator.exception.StudentNotEnrolledException;
import com.tutorbot.evaluator.exception.TopicInactiveException;
import com.tutorbot.evaluator.exception.TopicNotFoundException;
import com.tutorbot.evaluator.model.Topic;
import com.tutorbot.evaluator.repository.LearningPathRepository;
import com.tutorbot.evaluator.repository.TopicRepository;

@Service
public class EvaluationGuardService {

    private final TopicRepository topicRepository;
    private final LearningPathRepository learningPathRepository;

    public EvaluationGuardService(TopicRepository topicRepository,
                                  LearningPathRepository learningPathRepository) {
        this.topicRepository = topicRepository;
        this.learningPathRepository = learningPathRepository;
    }

    public void validate(String studentId, Long topicId) {
        validateTopicExists(topicId);
        validateTopicIsActive(topicId);
        validateSkillIsActive(topicId);
        validateStudentEnrollment(studentId, topicId);
    }

    private void validateTopicExists(Long topicId) {
        if (!topicRepository.existsById(topicId)) {
            throw new TopicNotFoundException(topicId);
        }
    }

    private void validateTopicIsActive(Long topicId) {
        Topic topic = topicRepository.findActiveById(topicId).orElse(null);
        if (topic == null) {
            throw new TopicInactiveException(topicId);
        }
    }

    private void validateSkillIsActive(Long topicId) {
        Boolean skillActive = topicRepository.isSkillActiveByTopicId(topicId);
        if (skillActive == null || !skillActive) {
            throw new SkillInactiveException(topicId);
        }
    }

    private void validateStudentEnrollment(String studentId, Long topicId) {
        if (!learningPathRepository.existsByStudentIdAndTopicId(studentId, topicId)) {
            throw new StudentNotEnrolledException(studentId, topicId);
        }
    }
}