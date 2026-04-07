package com.tutorbot.evaluator.ollama;

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

    public String evaluate(String questionText, String studentAnswer, String correctAnswer) {
        String prompt = buildEvaluationPrompt(questionText, studentAnswer, correctAnswer);
        return callOllama(prompt);
    }

    public String generateFeedback(String questionText, String studentAnswer, int score, int maxScore) {
        String prompt = buildFeedbackPrompt(questionText, studentAnswer, score, maxScore);
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
            return "Unable to generate evaluation at this time.";
        } catch (RestClientException e) {
            log.error("Ollama call failed: {}", e.getMessage());
            return "Evaluation service temporarily unavailable.";
        }
    }

    private String buildEvaluationPrompt(String question, String studentAnswer, String correctAnswer) {
        return """
                You are an academic evaluator. Evaluate the student's answer.
                
                Question: %s
                
                Student's Answer: %s
                
                Correct Answer: %s
                
                Respond ONLY with a JSON object (no markdown, no explanation):
                {"score": <0-100>, "feedback": "<brief feedback in Spanish>"}
                """.formatted(question, studentAnswer, correctAnswer);
    }

    private String buildFeedbackPrompt(String question, String studentAnswer, int score, int maxScore) {
        return """
                You are a university tutor. The student scored %d/%d on the following question.
                
                Question: %s
                Student's Answer: %s
                
                Provide helpful feedback in Spanish to help them improve. Be encouraging but specific.
                Keep it under 200 words.
                """.formatted(score, maxScore, question, studentAnswer);
    }
}
