package com.tutorbot.gapdetector.agent;

import java.util.Map;
import org.springframework.stereotype.Component;

@Component
public class GapDetectorAgent {

    public Map<String, String> gapDetected(String gapId, String concept) {
        return Map.of(
                "event", "gap.detected",
                "gapId", gapId,
                "concept", concept);
    }
}
