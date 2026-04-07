package com.tutorbot.evaluator.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import com.tutorbot.evaluator.model.EvaluationResult;
import com.tutorbot.evaluator.ollama.OllamaService;
import com.tutorbot.evaluator.repository.EvaluationResultRepository;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

class EvaluationServiceTest {

    @Test
    void shouldReturnPersistedEvaluations() {
        EvaluationResultRepository repository = Mockito.mock(EvaluationResultRepository.class);
        OllamaService ollamaService = Mockito.mock(OllamaService.class);
        EvaluationResult evaluationResult = new EvaluationResult();
        evaluationResult.setScore(92);
        when(repository.findAll()).thenReturn(List.of(evaluationResult));

        EvaluationService service = new EvaluationService(repository, ollamaService);

        assertEquals(92, service.findAll().getFirst().score());
    }
}
