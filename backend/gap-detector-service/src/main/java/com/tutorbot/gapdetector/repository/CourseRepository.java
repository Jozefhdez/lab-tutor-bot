package com.tutorbot.gapdetector.repository;

import com.tutorbot.gapdetector.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
