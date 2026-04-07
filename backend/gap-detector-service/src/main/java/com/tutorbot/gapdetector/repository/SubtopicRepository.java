package com.tutorbot.gapdetector.repository;

import com.tutorbot.gapdetector.model.Subtopic;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubtopicRepository extends JpaRepository<Subtopic, Long> {

    List<Subtopic> findByTopicId(Long topicId);
}
