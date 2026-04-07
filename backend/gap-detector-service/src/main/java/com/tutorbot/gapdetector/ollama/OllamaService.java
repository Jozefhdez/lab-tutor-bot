package com.tutorbot.gapdetector.ollama;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class OllamaService {

    private static final Logger log = LoggerFactory.getLogger(OllamaService.class);

    private final RestTemplate restTemplate;
    private final String model;

    public OllamaService(
            @Qualifier("ollamaRestTemplate") RestTemplate restTemplate,
            @Value("${ollama.model}") String model) {
        this.restTemplate = restTemplate;
        this.model = model;
    }

    public String analyzeGaps(String studentId, String evaluationHistory) {
        String prompt = buildGapAnalysisPrompt(studentId, evaluationHistory);
        return callOllama(prompt);
    }

    public String suggestRemediation(String concept, String severity) {
        String prompt = buildRemediationPrompt(concept, severity);
        return callOllama(prompt);
    }

    private String callOllama(String prompt) {
        try {
            var request = new OllamaDto.GenerateRequest(model, prompt);
            var response = restTemplate.postForObject("/api/generate", request, OllamaDto.GenerateResponse.class);
            if (response != null && response.response() != null) {
                log.debug("Ollama responded in {} ns", response.totalDuration());
                return response.response().trim();
            }
            log.warn("Ollama returned null response");
            return "Unable to analyze gaps at this time.";
        } catch (RestClientException e) {
            log.error("Ollama call failed: {}", e.getMessage());
            return "Gap analysis service temporarily unavailable.";
        }
    }

    private String buildGapAnalysisPrompt(String studentId, String evaluationHistory) {
        return """
                You are a learning analytics expert. Analyze the following evaluation results \
                for student %s and identify learning gaps.
                
                Evaluation History:
                %s
                
                Respond ONLY with a JSON array (no markdown, no explanation):
                [{"concept": "<topic or concept>", "severity": "HIGH|MEDIUM|LOW", \
                "confidence": <0.0-1.0>, "reasoning": "<brief reasoning in Spanish>"}]
                """.formatted(studentId, evaluationHistory);
    }

    private String buildRemediationPrompt(String concept, String severity) {
        return """
                You are a university tutor. A student has a %s learning gap in: %s
                
                Provide a brief remediation plan in Spanish with:
                1. Key concepts to review
                2. Suggested exercises
                3. Recommended study strategy
                
                Keep it under 200 words.
                """.formatted(severity, concept);
    }
}
