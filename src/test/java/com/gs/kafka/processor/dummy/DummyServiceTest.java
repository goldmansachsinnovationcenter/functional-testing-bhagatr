package com.gs.kafka.processor.dummy;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Test class for DummyService
 */
public class DummyServiceTest {
    
    @Test
    public void testPerformOperation() {
        DummyService service = new DummyService();
        assertTrue(service.performOperation(), "Operation should return true");
    }
    
    @Test
    public void testGetMessage() {
        DummyService service = new DummyService();
        assertEquals("Hello from Kafka Iceberg Processor", service.getMessage(), 
                    "Message should match expected value");
    }
    
    @Test
    public void testCalculateWithHighValue() {
        DummyService service = new DummyService();
        assertEquals(30, service.calculate(15), "Should double values greater than 10");
    }
    
    @Test
    public void testCalculateWithLowValue() {
        DummyService service = new DummyService();
        assertEquals(5, service.calculate(5), "Should return same value for values 10 or less");
    }
}
