package com.tutorbot.gapdetector.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "GAPS")
public class LearningGap {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_gaps")
    @SequenceGenerator(name = "seq_gaps", sequenceName = "SEQ_GAPS", allocationSize = 1)
    private Long id;

    @Column(name = "STUDENT_ID", nullable = false)
    private String studentId;

    @Column(name = "TOPIC_ID")
    private Long topicId;

    @Column(name = "SUBTOPIC_ID")
    private Long subtopicId;

    @Column(name = "CONCEPT", nullable = false)
    private String concept;

    @Column(name = "SEVERITY", nullable = false)
    private String severity;

    @Column(name = "CONFIDENCE")
    private Double confidence;

    @Column(name = "DETECTED_AT")
    private LocalDateTime detectedAt;

    @Column(name = "RESOLVED")
    private Boolean resolved;

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

    public Long getSubtopicId() {
        return subtopicId;
    }

    public void setSubtopicId(Long subtopicId) {
        this.subtopicId = subtopicId;
    }

    public String getConcept() {
        return concept;
    }

    public void setConcept(String concept) {
        this.concept = concept;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public Double getConfidence() {
        return confidence;
    }

    public void setConfidence(Double confidence) {
        this.confidence = confidence;
    }

    public LocalDateTime getDetectedAt() {
        return detectedAt;
    }

    public void setDetectedAt(LocalDateTime detectedAt) {
        this.detectedAt = detectedAt;
    }

    public Boolean getResolved() {
        return resolved;
    }

    public void setResolved(Boolean resolved) {
        this.resolved = resolved;
    }
}
