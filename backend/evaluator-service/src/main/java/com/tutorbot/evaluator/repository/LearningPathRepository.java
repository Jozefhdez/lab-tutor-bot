package com.tutorbot.evaluator.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tutorbot.evaluator.model.LearningPathEntity;

public interface LearningPathRepository extends JpaRepository<LearningPathEntity, Long> {

    @Query("SELECT COUNT(lp) > 0 " +
            "FROM LearningPathEntity lp " +
            "WHERE lp.studentId = :studentId " +
            "AND lp.topicId = :topicId")
    boolean existsByStudentIdAndTopicId(@Param("studentId") String studentId, @Param("topicId") Long topicId);
}