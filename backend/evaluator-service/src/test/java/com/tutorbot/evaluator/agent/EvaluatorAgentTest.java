package com.tutorbot.evaluator.agent;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class EvaluatorAgentTest {

    @Test
    void shouldDescribeEvaluationCompletedEvent() {
        EvaluatorAgent agent = new EvaluatorAgent();

        assertEquals("evaluation.completed", agent.evaluationCompleted("eval-1", "PASS").get("event"));
    }
}
