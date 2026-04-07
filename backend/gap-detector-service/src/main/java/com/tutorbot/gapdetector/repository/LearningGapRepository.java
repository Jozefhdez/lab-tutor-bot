package com.tutorbot.gapdetector.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tutorbot.gapdetector.model.LearningGap;

public interface LearningGapRepository extends JpaRepository<LearningGap, Long> {

    List<LearningGap> findByStudentId(String studentId);

    List<LearningGap> findByStudentIdAndResolved(String studentId, Boolean resolved);

    List<LearningGap> findByStudentIdAndTopicId(String studentId, Long topicId);

    List<LearningGap> findByTopicId(Long topicId);

    List<LearningGap> findBySubtopicId(Long subtopicId);
}
