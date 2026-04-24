package com.tutorbot.evaluator.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "LEARNING_PATHS")
public class LearningPathEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_learning_paths")
    @SequenceGenerator(name = "seq_learning_paths", sequenceName = "SEQ_LEARNING_PATHS", allocationSize = 1)
    private Long id;

    @Column(name = "STUDENT_ID", nullable = false)
    private String studentId;

    @Column(name = "TOPIC_ID", nullable = false)
    private Long topicId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Long getTopicId() {
        return topicId;
    }

    public void setTopicId(Long topicId) {
        this.topicId = topicId;
    }
}