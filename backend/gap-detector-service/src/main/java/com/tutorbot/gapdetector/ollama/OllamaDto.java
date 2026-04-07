package com.tutorbot.gapdetector.ollama;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Map;

public final class OllamaDto {

    private OllamaDto() {
    }

    public record GenerateRequest(
            String model,
            String prompt,
            Boolean stream,
            Map<String, Object> options) {

        public GenerateRequest(String model, String prompt) {
            this(model, prompt, false, Map.of("temperature", 0.3));
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record GenerateResponse(
            String model,
            String response,
            @JsonProperty("total_duration") Long totalDuration) {

    }
}
