package com.tutorbot.evaluator.agent;

import java.util.Map;
import org.springframework.stereotype.Component;

@Component
public class EvaluatorAgent {

    public Map<String, String> evaluationCompleted(String evaluationId, String outcome) {
        return Map.of(
                "event", "evaluation.completed",
                "evaluationId", evaluationId,
                "outcome", outcome);
    }
}
