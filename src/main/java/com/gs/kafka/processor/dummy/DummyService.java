package com.gs.kafka.processor.dummy;

/**
 * Simple service class for testing coverage reporting
 */
public class DummyService {
    
    /**
     * Performs a simple operation
     * @return true if operation is successful
     */
    public boolean performOperation() {
        return true;
    }
    
    /**
     * Gets a message from the service
     * @return a greeting message
     */
    public String getMessage() {
        return "Hello from Kafka Iceberg Processor";
    }
    
    /**
     * Calculates a value based on input
     * @param value input value
     * @return calculated result
     */
    public int calculate(int value) {
        if (value > 10) {
            return value * 2;
        } else {
            return value;
        }
    }
}
