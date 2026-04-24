package com.tutorbot.evaluator.service;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import static org.mockito.Mockito.when;

import com.tutorbot.evaluator.exception.SkillInactiveException;
import com.tutorbot.evaluator.exception.StudentNotEnrolledException;
import com.tutorbot.evaluator.exception.TopicInactiveException;
import com.tutorbot.evaluator.exception.TopicNotFoundException;
import com.tutorbot.evaluator.model.Skill;
import com.tutorbot.evaluator.model.Topic;
import com.tutorbot.evaluator.repository.LearningPathRepository;
import com.tutorbot.evaluator.repository.TopicRepository;

class EvaluationGuardServiceTest {

    private EvaluationGuardService guard;
    private TopicRepository topicRepository;
    private LearningPathRepository learningPathRepository;

    @BeforeEach
    void setUp() {
        topicRepository = Mockito.mock(TopicRepository.class);
        learningPathRepository = Mockito.mock(LearningPathRepository.class);
        guard = new EvaluationGuardService(topicRepository, learningPathRepository);
    }

    @Test
    void happyPath_validStudentAndTopic_passes() {
        Long topicId = 1L;
        String studentId = "A01639866";

        Skill skill = new Skill();
        skill.setId(1L);
        skill.setActive(true);

        Topic topic = new Topic();
        topic.setId(topicId);
        topic.setActive(true);
        topic.setSkill(skill);

        when(topicRepository.existsById(topicId)).thenReturn(true);
        when(topicRepository.findActiveById(topicId)).thenReturn(Optional.of(topic));
        when(topicRepository.isSkillActiveByTopicId(topicId)).thenReturn(true);
        when(learningPathRepository.existsByStudentIdAndTopicId(studentId, topicId)).thenReturn(true);

        assertDoesNotThrow(() -> guard.validate(studentId, topicId));
    }

    @Test
    void topicDoesNotExist_throwsTopicNotFoundException() {
        Long topicId = 750L;
        String studentId = "A01639866";

        when(topicRepository.existsById(topicId)).thenReturn(false);

        assertThrows(TopicNotFoundException.class, () -> guard.validate(studentId, topicId));
    }

    @Test
    void topicExistsButInactive_throwsTopicInactiveException() {
        Long topicId = 14L;
        String studentId = "A01639866";

        when(topicRepository.existsById(topicId)).thenReturn(true);
        when(topicRepository.findActiveById(topicId)).thenReturn(Optional.empty());

        assertThrows(TopicInactiveException.class, () -> guard.validate(studentId, topicId));
    }

    @Test
    void skillInactive_throwsSkillInactiveException() {
        Long topicId = 5L;
        String studentId = "A01639866";

        Topic topic = new Topic();
        topic.setId(topicId);
        topic.setActive(true);

        when(topicRepository.existsById(topicId)).thenReturn(true);
        when(topicRepository.findActiveById(topicId)).thenReturn(Optional.of(topic));
        when(topicRepository.isSkillActiveByTopicId(topicId)).thenReturn(false);

        assertThrows(SkillInactiveException.class, () -> guard.validate(studentId, topicId));
    }

    @Test
    void studentNotEnrolled_throwsStudentNotEnrolledException() {
        Long topicId = 1L;
        String studentId = "A01639866";

        Topic topic = new Topic();
        topic.setId(topicId);
        topic.setActive(true);

        when(topicRepository.existsById(topicId)).thenReturn(true);
        when(topicRepository.findActiveById(topicId)).thenReturn(Optional.of(topic));
        when(topicRepository.isSkillActiveByTopicId(topicId)).thenReturn(true);
        when(learningPathRepository.existsByStudentIdAndTopicId(studentId, topicId)).thenReturn(false);

        assertThrows(StudentNotEnrolledException.class, () -> guard.validate(studentId, topicId));
    }
}