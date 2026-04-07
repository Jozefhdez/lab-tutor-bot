package com.tutorbot.gapdetector.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tutorbot.gapdetector.dto.GapDetectionRequest;
import com.tutorbot.gapdetector.dto.GapResponse;
import com.tutorbot.gapdetector.service.GapDetectorService;

@RestController
@RequestMapping("/api/v1/gaps")
public class GapDetectorController {

    private final GapDetectorService gapDetectorService;

    public GapDetectorController(GapDetectorService gapDetectorService) {
        this.gapDetectorService = gapDetectorService;
    }

    @GetMapping
    public ResponseEntity<List<GapResponse>> listGaps() {
        return ResponseEntity.ok(gapDetectorService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<GapResponse> getGap(@PathVariable Long id) {
        return ResponseEntity.ok(gapDetectorService.findById(id));
    }

    @GetMapping("/student/{studentId}")
    public ResponseEntity<List<GapResponse>> getByStudent(@PathVariable String studentId) {
        return ResponseEntity.ok(gapDetectorService.findByStudentId(studentId));
    }

    @GetMapping("/student/{studentId}/unresolved")
    public ResponseEntity<List<GapResponse>> getUnresolvedByStudent(@PathVariable String studentId) {
        return ResponseEntity.ok(gapDetectorService.findUnresolvedByStudent(studentId));
    }

    @PostMapping
    public ResponseEntity<GapResponse> createGap(@RequestBody GapDetectionRequest request) {
        GapResponse response = gapDetectorService.createGap(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PatchMapping("/{id}/resolve")
    public ResponseEntity<GapResponse> resolveGap(@PathVariable Long id) {
        return ResponseEntity.ok(gapDetectorService.resolveGap(id));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleNotFound(IllegalArgumentException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(Map.of("error", ex.getMessage()));
    }
}
