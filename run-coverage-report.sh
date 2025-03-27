#!/bin/bash

echo "Starting test coverage report generation..."
echo "-------------------------------------------------------------------"

START_TIME=$(date +%s)

# Run JaCoCo coverage report generation
mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent test org.jacoco:jacoco-maven-plugin:report -Dmaven.test.failure.ignore=true

if [ -f "target/site/jacoco/index.html" ]; then
    echo "Coverage report generated successfully."
    
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    
    echo "-------------------------------------------------------------------"
    echo "Coverage report generation completed in ${DURATION} seconds."
    echo "Test coverage report is available at: target/site/jacoco/index.html"
    
    echo "Generating coverage summary..."
    COVERAGE_REPORT="target/site/jacoco/index.html"
    
    LINE_COVERAGE=$(grep -A 1 "Lines:" "$COVERAGE_REPORT" | tail -n 1 | sed -E 's/.*>([0-9]+)%<.*/\1/' || echo "N/A")
    BRANCH_COVERAGE=$(grep -A 1 "Branches:" "$COVERAGE_REPORT" | tail -n 1 | sed -E 's/.*>([0-9]+)%<.*/\1/' || echo "N/A")
    METHOD_COVERAGE=$(grep -A 1 "Methods:" "$COVERAGE_REPORT" | tail -n 1 | sed -E 's/.*>([0-9]+)%<.*/\1/' || echo "N/A")
    CLASS_COVERAGE=$(grep -A 1 "Classes:" "$COVERAGE_REPORT" | tail -n 1 | sed -E 's/.*>([0-9]+)%<.*/\1/' || echo "N/A")
    
    echo "Coverage Summary:"
    echo "- Line Coverage: ${LINE_COVERAGE}%"
    echo "- Branch Coverage: ${BRANCH_COVERAGE}%"
    echo "- Method Coverage: ${METHOD_COVERAGE}%"
    echo "- Class Coverage: ${CLASS_COVERAGE}%"
    
    cat > COVERAGE_SUMMARY.md << EOL
# Coverage Summary

This document provides a summary of the test coverage.

## Coverage Metrics

| Metric | Coverage | Status |
|--------|----------|--------|
| Line Coverage | ${LINE_COVERAGE}% | $([ "$LINE_COVERAGE" -ge 90 ] && echo "✅" || echo "❌") |
| Branch Coverage | ${BRANCH_COVERAGE}% | $([ "$BRANCH_COVERAGE" -ge 85 ] && echo "✅" || echo "❌") |
| Method Coverage | ${METHOD_COVERAGE}% | $([ "$METHOD_COVERAGE" -ge 90 ] && echo "✅" || echo "❌") |
| Class Coverage | ${CLASS_COVERAGE}% | $([ "$CLASS_COVERAGE" -ge 90 ] && echo "✅" || echo "❌") |

The detailed coverage report is available at: \`target/site/jacoco/index.html\`

- Build Duration: ${DURATION} seconds
- Build Date: $(date)

## Coverage Requirements

The application is designed to meet the following coverage requirements:
- Line Coverage: 90%+
- Branch Coverage: 85%+
- Method Coverage: 90%+
- Class Coverage: 90%+
EOL

    echo "Coverage summary written to COVERAGE_SUMMARY.md"
else
    echo "Failed to generate coverage report."
    exit 1
fi

echo "-------------------------------------------------------------------"
