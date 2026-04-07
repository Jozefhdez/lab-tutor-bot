package com.tutorbot.gapdetector.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import com.tutorbot.gapdetector.model.LearningGap;
import com.tutorbot.gapdetector.ollama.OllamaService;
import com.tutorbot.gapdetector.repository.LearningGapRepository;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

class GapDetectorServiceTest {

    @Test
    void shouldReturnLearningGaps() {
        LearningGapRepository repository = Mockito.mock(LearningGapRepository.class);
        OllamaService ollamaService = Mockito.mock(OllamaService.class);
        LearningGap gap = new LearningGap();
        gap.setConcept("limits");
        when(repository.findAll()).thenReturn(List.of(gap));

        GapDetectorService service = new GapDetectorService(repository, ollamaService);

        assertEquals("limits", service.findAll().getFirst().concept());
    }
}
