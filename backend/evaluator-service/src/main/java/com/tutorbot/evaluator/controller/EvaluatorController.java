package com.tutorbot.evaluator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tutorbot.evaluator.dto.EvaluationRequest;
import com.tutorbot.evaluator.dto.EvaluationResponse;
import com.tutorbot.evaluator.service.EvaluationService;

@RestController
@RequestMapping("/api/v1/evaluations")
public class EvaluatorController {

    private final EvaluationService evaluationService;

    public EvaluatorController(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }

    @GetMapping
    public ResponseEntity<List<EvaluationResponse>> listEvaluations() {
        return ResponseEntity.ok(evaluationService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<EvaluationResponse> getEvaluation(@PathVariable Long id) {
        return ResponseEntity.ok(evaluationService.findById(id));
    }

    @GetMapping("/student/{studentId}")
    public ResponseEntity<List<EvaluationResponse>> getByStudent(@PathVariable String studentId) {
        return ResponseEntity.ok(evaluationService.findByStudentId(studentId));
    }

    @GetMapping("/session/{sessionId}")
    public ResponseEntity<List<EvaluationResponse>> getBySession(@PathVariable String sessionId) {
        return ResponseEntity.ok(evaluationService.findBySessionId(sessionId));
    }

    @PostMapping
    public ResponseEntity<EvaluationResponse> evaluate(@RequestBody EvaluationRequest request) {
        EvaluationResponse response = evaluationService.evaluate(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleNotFound(IllegalArgumentException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(Map.of("error", ex.getMessage()));
    }
}
