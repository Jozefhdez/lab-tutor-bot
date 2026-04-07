package com.tutorbot.evaluator.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "EVALUATIONS")
public class EvaluationResult {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_evaluations")
    @SequenceGenerator(name = "seq_evaluations", sequenceName = "SEQ_EVALUATIONS", allocationSize = 1)
    private Long id;

    @Column(name = "SESSION_ID", nullable = false)
    private String sessionId;

    @Column(name = "STUDENT_ID", nullable = false)
    private String studentId;

    @Column(name = "QUESTION_TEXT")
    @Lob
    private String questionText;

    @Column(name = "STUDENT_ANSWER")
    @Lob
    private String studentAnswer;

    @Column(name = "CORRECT_ANSWER")
    @Lob
    private String correctAnswer;

    @Column(name = "SCORE")
    private Integer score;

    @Column(name = "MAX_SCORE")
    private Integer maxScore;

    @Column(name = "FEEDBACK_SUMMARY")
    @Lob
    private String feedbackSummary;

    @Column(name = "TOPIC_ID")
    private Long topicId;

    @Column(name = "EVALUATED_AT")
    private LocalDateTime evaluatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Integer maxScore) {
        this.maxScore = maxScore;
    }

    public String getFeedbackSummary() {
        return feedbackSummary;
    }

    public void setFeedbackSummary(String feedbackSummary) {
        this.feedbackSummary = feedbackSummary;
    }

    public Long getTopicId() {
        return topicId;
    }

    public void setTopicId(Long topicId) {
        this.topicId = topicId;
    }

    public LocalDateTime getEvaluatedAt() {
        return evaluatedAt;
    }

    public void setEvaluatedAt(LocalDateTime evaluatedAt) {
        this.evaluatedAt = evaluatedAt;
    }
}
