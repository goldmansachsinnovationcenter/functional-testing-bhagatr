# Test Coverage Report

## Overview
This document provides information about test coverage configuration and reporting for the project.

## Coverage Configuration

The project uses JaCoCo for test coverage analysis. The configuration includes:

1. **JaCoCo Maven Plugin**: Configured in the `pom.xml` file to generate coverage reports during the test phase.
2. **Lombok Configuration**: A `lombok.config` file is added to properly handle Lombok-generated code in coverage metrics.
3. **Coverage Report Script**: A `run-coverage-report.sh` script is provided to generate and analyze coverage reports.

## Coverage Requirements

The project aims to meet the following coverage requirements:

| Metric | Target |
|--------|--------|
| Line Coverage | 90%+ |
| Branch Coverage | 85%+ |
| Method Coverage | 90%+ |
| Class Coverage | 90%+ |

## How to Generate Coverage Reports

To generate a coverage report, run:

```bash
./run-coverage-report.sh
```

This will:
1. Run tests with JaCoCo agent
2. Generate HTML reports
3. Create a summary of coverage metrics in `COVERAGE_SUMMARY.md`

## Viewing Coverage Reports

After running the script, you can view the detailed coverage report at:
```
target/site/jacoco/index.html
```

## Lombok Integration

The `lombok.config` file contains:

```
config.stopBubbling = true
lombok.addLombokGeneratedAnnotation = true
```

This ensures Lombok-generated code (like getters, setters, builders) is properly marked and excluded from test coverage calculations, preventing artificially low coverage metrics.

## Continuous Integration

The coverage report generation is integrated into the CI pipeline to ensure coverage metrics are maintained with each commit.
