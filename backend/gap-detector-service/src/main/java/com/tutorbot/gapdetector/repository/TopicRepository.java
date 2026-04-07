package com.tutorbot.gapdetector.repository;

import com.tutorbot.gapdetector.model.Topic;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepository extends JpaRepository<Topic, Long> {

    List<Topic> findByCourseId(Long courseId);
}
