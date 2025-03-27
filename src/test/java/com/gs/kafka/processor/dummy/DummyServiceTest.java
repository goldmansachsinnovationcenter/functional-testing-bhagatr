package com.gs.kafka.processor.dummy;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Test class for DummyService
 */
public class DummyServiceTest {
    
    @Test
    public void testPerformOperation() {
        DummyService service = new DummyService();
        assertTrue("Operation should return true", service.performOperation());
    }
    
    @Test
    public void testGetMessage() {
        DummyService service = new DummyService();
        assertEquals("Message should match expected value", 
                    "Hello from Kafka Iceberg Processor", service.getMessage());
    }
    
    @Test
    public void testCalculateWithHighValue() {
        DummyService service = new DummyService();
        assertEquals("Should double values greater than 10", 30, service.calculate(15));
    }
    
    @Test
    public void testCalculateWithLowValue() {
        DummyService service = new DummyService();
        assertEquals("Should return same value for values 10 or less", 5, service.calculate(5));
    }
}
