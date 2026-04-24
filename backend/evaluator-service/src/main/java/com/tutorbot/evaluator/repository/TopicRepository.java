package com.tutorbot.evaluator.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tutorbot.evaluator.model.Topic;

public interface TopicRepository extends JpaRepository<Topic, Long> {

    @Query("SELECT t FROM Topic t WHERE t.id = :topicId AND t.active = true")
    Optional<Topic> findActiveById(@Param("topicId") Long topicId);

    @Query("SELECT CASE WHEN t.skill.active = true THEN true ELSE false END FROM Topic t WHERE t.id = :topicId")
    Boolean isSkillActiveByTopicId(@Param("topicId") Long topicId);
}