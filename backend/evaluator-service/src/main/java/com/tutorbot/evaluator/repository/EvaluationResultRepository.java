package com.tutorbot.evaluator.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tutorbot.evaluator.model.EvaluationResult;

public interface EvaluationResultRepository extends JpaRepository<EvaluationResult, Long> {

    List<EvaluationResult> findByStudentId(String studentId);

    List<EvaluationResult> findBySessionId(String sessionId);

    List<EvaluationResult> findByTopicId(Long topicId);

    List<EvaluationResult> findByStudentIdAndTopicId(String studentId, Long topicId);
}
