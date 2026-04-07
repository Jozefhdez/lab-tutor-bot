package com.tutorbot.gapdetector.agent;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class GapDetectorAgentTest {

    @Test
    void shouldDescribeGapDetectedEvent() {
        GapDetectorAgent agent = new GapDetectorAgent();

        assertEquals("gap.detected", agent.gapDetected("gap-1", "limits").get("event"));
    }
}
