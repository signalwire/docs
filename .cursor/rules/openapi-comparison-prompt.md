# OpenAPI Spec Comparison Analysis Prompt Template

## Task Overview

You are tasked with performing a comprehensive line-by-line comparison between a manually maintained OpenAPI specification and its auto-generated TypeSpec counterpart. Your goal is to identify all missing elements in the auto-generated spec and document them in a structured markdown scratchpad for future TypeSpec implementation.

## Input Parameters

**Manual Spec Path:** `{MANUAL_SPEC_PATH}`
**Auto-Generated Spec Path:** `{AUTO_GENERATED_SPEC_PATH}`
**API Name:** `{API_NAME}`
**Scratchpad Output Path:** `{SCRATCHPAD_OUTPUT_PATH}`

## Analysis Methodology

### Step 1: Load and Parse Both Specifications

1. Read both OpenAPI specification files completely
2. Parse and extract all structural elements from each spec
3. Create an inventory of all endpoints, methods, parameters, schemas, and metadata

### Step 2: Create Comparison Matrix

For each endpoint in the manual spec, document:
- **Path**: The endpoint path
- **Method**: HTTP method (GET, POST, PUT, DELETE, etc.)
- **Parameters**: All path, query, header, and cookie parameters
- **Request Body**: Schema, content type, examples
- **Responses**: All response codes, schemas, examples
- **Authentication**: Security requirements
- **Documentation**: Descriptions, summaries, examples
- **Tags**: Operation tagging and categorization

### Step 3: Identify Missing Elements

Compare each element from the manual spec against the auto-generated spec and categorize gaps:

1. **Missing Endpoints**: Complete endpoints not present in auto-generated spec
2. **Missing Parameters**: Parameters missing from existing endpoints
3. **Missing Response Codes**: Response codes not covered in auto-generated spec
4. **Schema Differences**: Model/schema structure differences
5. **Missing Examples**: Example values not present in auto-generated spec
6. **Documentation Gaps**: Missing descriptions, summaries, or documentation
7. **Authentication Differences**: Security method mismatches

### Step 4: Document Findings in Markdown Scratchpad

Create a comprehensive markdown scratchpad with the following structure:

## Scratchpad Format Specification

```markdown
# {API_NAME} OpenAPI Spec Comparison Analysis

## Overview
- **Manual Spec**: {MANUAL_SPEC_PATH}
- **Auto-Generated Spec**: {AUTO_GENERATED_SPEC_PATH}
- **Analysis Date**: {DATE}

## Summary Statistics
- Total endpoints in manual spec: {COUNT}
- Total endpoints in auto-generated spec: {COUNT}
- Missing endpoints: {COUNT}
- Endpoints with differences: {COUNT}

## Detailed Comparison

### 1. Missing Endpoints

#### {ENDPOINT_PATH} {HTTP_METHOD}
**Status**: Missing entirely from auto-generated spec
**Manual Spec Details**:
- **Summary**: {SUMMARY}
- **Description**: {DESCRIPTION}
- **Parameters**:
  - {PARAM_NAME} ({PARAM_TYPE}): {DESCRIPTION} [Required: {YES/NO}]
- **Request Body**: {SCHEMA_DESCRIPTION}
- **Responses**:
  - {STATUS_CODE}: {DESCRIPTION} - {SCHEMA}
- **Authentication**: {AUTH_METHOD}
- **Examples**: {EXAMPLES}

**TypeSpec Implementation Required**:
- Create {RESOURCE_NAME} interface in TypeSpec
- Add {OPERATION_NAME} operation
- Define {MODEL_NAME} models for request/response
- Add appropriate decorators and documentation

---

### 2. Endpoints with Differences

#### {ENDPOINT_PATH} {HTTP_METHOD}
**Status**: Exists in both specs but has differences

**Missing Parameters**:
- {PARAM_NAME} ({PARAM_TYPE}): {DESCRIPTION} [Required: {YES/NO}]

**Missing Response Codes**:
- {STATUS_CODE}: {DESCRIPTION} - {SCHEMA}

**Schema Differences**:
- Manual spec has {FIELD_NAME} field not present in auto-generated
- Type mismatch: {FIELD_NAME} is {TYPE1} in manual, {TYPE2} in auto-generated

**Missing Examples**:
- Parameter {PARAM_NAME} lacks example value
- Response {STATUS_CODE} lacks example

**Documentation Gaps**:
- Missing operation summary
- Missing parameter descriptions
- Missing response descriptions

**TypeSpec Implementation Required**:
- Add missing parameters to {MODEL_NAME}
- Add missing response codes to operation
- Update model schemas with missing fields
- Add missing examples and documentation

---

### 3. Schema Analysis

#### Missing Models
- {MODEL_NAME}: {DESCRIPTION}
  - Used in: {ENDPOINT_PATHS}
  - Properties: {PROPERTY_LIST}

#### Model Differences
- {MODEL_NAME}:
  - Missing properties: {PROPERTY_LIST}
  - Type mismatches: {FIELD_NAME} ({EXPECTED_TYPE} vs {ACTUAL_TYPE})

### 4. Authentication Differences

#### Missing Security Schemes
- {SECURITY_SCHEME_NAME}: {DESCRIPTION}
  - Type: {AUTH_TYPE}
  - Used in: {ENDPOINT_LIST}

#### Security Application Differences
- {ENDPOINT_PATH}: Manual requires {AUTH_METHOD}, auto-generated has {AUTH_METHOD}

### 5. Documentation Gaps

#### Missing Operation Documentation
- {ENDPOINT_PATH} {HTTP_METHOD}: Missing {SUMMARY/DESCRIPTION/EXAMPLES}

#### Missing Parameter Documentation
- {ENDPOINT_PATH} {HTTP_METHOD} > {PARAM_NAME}: Missing {DESCRIPTION/EXAMPLE}

#### Missing Response Documentation
- {ENDPOINT_PATH} {HTTP_METHOD} > {STATUS_CODE}: Missing {DESCRIPTION/EXAMPLE}

## Action Items for TypeSpec Implementation

### High Priority
1. **Missing Endpoints**: Create {COUNT} missing endpoints
   - {ENDPOINT_PATH} {HTTP_METHOD}
   - Implementation: Add to {TYPESPEC_FILE}

2. **Missing Models**: Create {COUNT} missing models
   - {MODEL_NAME}
   - Implementation: Add to {TYPESPEC_FILE}

### Medium Priority
1. **Parameter Additions**: Add {COUNT} missing parameters
2. **Response Code Additions**: Add {COUNT} missing response codes
3. **Schema Updates**: Update {COUNT} models with missing fields

### Low Priority
1. **Documentation Enhancements**: Add missing descriptions and examples
2. **Authentication Updates**: Align security requirements

## TypeSpec File Modifications Required

### {TYPESPEC_FILE_PATH}
- Add {OPERATION_NAME} operation
- Create {MODEL_NAME} models
- Add missing decorators: @doc, @example, @summary

### {MODELS_FILE_PATH}
- Define {MODEL_NAME} models
- Add missing properties
- Add proper type annotations

## Next Steps

1. Use this scratchpad to guide TypeSpec implementation
2. Implement high-priority items first
3. Test TypeSpec compilation after each major change
4. Verify generated OpenAPI matches manual spec
5. Update documentation as needed

## Notes

- Pay special attention to breaking changes
- Ensure backwards compatibility
- Validate all examples are realistic
- Check for consistent naming conventions
- Verify proper use of TypeSpec decorators
```

## Execution Instructions

1. **Load both OpenAPI specs** using the provided paths
2. **Perform systematic comparison** following the methodology above
3. **Create the markdown scratchpad** using the format specification
4. **Document every difference** with specific details and implementation notes
5. **Prioritize findings** based on impact and complexity
6. **Provide actionable TypeSpec implementation guidance**

## Quality Assurance

- Ensure all endpoints from manual spec are accounted for
- Verify all schema differences are documented
- Check that implementation notes are specific and actionable
- Validate that the scratchpad can be used independently for TypeSpec implementation
- Confirm all missing elements are categorized correctly

## Output Requirements

- Complete markdown scratchpad file at the specified output path
- Summary statistics of the comparison
- Detailed findings with specific implementation guidance
- Prioritized action items for TypeSpec development
- Clear next steps for implementation

## Usage Instructions

To use this template:

1. Replace `{MANUAL_SPEC_PATH}` with the path to your manual OpenAPI spec
2. Replace `{AUTO_GENERATED_SPEC_PATH}` with the path to your TypeSpec-generated spec
3. Replace `{API_NAME}` with your API name (e.g., "Fabric API", "Calling API")
4. Replace `{SCRATCHPAD_OUTPUT_PATH}` with desired output path for the scratchpad file
5. Execute the analysis following the methodology above

The resulting scratchpad will serve as a comprehensive guide for implementing missing TypeSpec components to achieve parity with the manual specification.