# OpenAPI Spec Comparison Analysis Prompt Template

## Task Overview

You are tasked with performing a comprehensive comparison between a manually maintained OpenAPI specification and its auto-generated TypeSpec counterpart. This can be used for two purposes:
1. **Gap Analysis**: Identify missing elements in the auto-generated spec for TypeSpec implementation
2. **Compatibility Audit**: Verify that TypeSpec-generated specs maintain API behavior compatibility with original specs

This prompt provides methods and tools for both comprehensive analysis and focused auditing of critical API behavior changes.

## Input Parameters

**Manual Spec Path:** `{MANUAL_SPEC_PATH}`
**Auto-Generated Spec Path:** `{AUTO_GENERATED_SPEC_PATH}`
**API Name:** `{API_NAME}`
**Scratchpad Output Path:** `{SCRATCHPAD_OUTPUT_PATH}`

## Analysis Methodology

### Approach A: Comprehensive Gap Analysis (For TypeSpec Implementation)

Use this approach when you need to identify missing elements in TypeSpec-generated specs for implementation.

#### Step 1: Load and Parse Both Specifications

1. Read both OpenAPI specification files completely
2. Parse and extract all structural elements from each spec
3. Create an inventory of all endpoints, methods, parameters, schemas, and metadata

#### Step 2: Create Comparison Matrix

For each endpoint in the manual spec, document:
- **Path**: The endpoint path
- **Method**: HTTP method (GET, POST, PUT, DELETE, etc.)
- **Parameters**: All path, query, header, and cookie parameters
- **Request Body**: Schema, content type, examples
- **Responses**: All response codes, schemas, examples
- **Authentication**: Security requirements
- **Documentation**: Descriptions, summaries, examples
- **Tags**: Operation tagging and categorization

#### Step 3: Identify Missing Elements

Compare each element from the manual spec against the auto-generated spec and categorize gaps:

1. **Missing Endpoints**: Complete endpoints not present in auto-generated spec
2. **Missing Parameters**: Parameters missing from existing endpoints
3. **Missing Response Codes**: Response codes not covered in auto-generated spec
4. **Schema Differences**: Model/schema structure differences
5. **Missing Examples**: Example values not present in auto-generated spec
6. **Documentation Gaps**: Missing descriptions, summaries, or documentation
7. **Authentication Differences**: Security method mismatches

#### Step 4: Document Findings in Markdown Scratchpad

Create a comprehensive markdown scratchpad with the following structure:

### Approach B: Focused Compatibility Audit (For API Behavior Verification)

Use this approach when you need to verify that TypeSpec-generated specs maintain API behavior compatibility with original specs, filtering out acceptable differences.

#### Step 1: Create Focused Comparison Script

Create a Python script using PyYAML to compare OpenAPI specifications with filtering capabilities:

```python
import yaml
import json
from typing import Dict, List, Any, Set

class FocusedComparator:
    def __init__(self, old_spec_path: str, new_spec_path: str):
        self.old_spec_path = old_spec_path
        self.new_spec_path = new_spec_path
        self.old_spec = None
        self.new_spec = None
        self.critical_issues = []
        
    def load_specifications(self):
        """Load both OpenAPI specifications"""
        with open(self.old_spec_path, 'r', encoding='utf-8') as f:
            self.old_spec = yaml.safe_load(f)
        with open(self.new_spec_path, 'r', encoding='utf-8') as f:
            self.new_spec = yaml.safe_load(f)
    
    def is_error_code(self, code: str) -> bool:
        """Filter out acceptable error codes"""
        return code in ['401', '404', '403', '500']
    
    def compare_response_codes(self, path: str, method: str, old_responses: Dict, new_responses: Dict) -> List[str]:
        """Compare response codes, focusing on critical changes"""
        issues = []
        old_codes = set(old_responses.keys())
        new_codes = set(new_responses.keys())
        
        # Critical: removed codes
        removed_codes = old_codes - new_codes
        for code in removed_codes:
            issues.append(f"⚠️ CRITICAL: Response code {code} was removed")
        
        # Critical: 200 -> 201 changes
        if '200' in old_codes and '200' not in new_codes and '201' in new_codes:
            issues.append(f"⚠️ CRITICAL: Response changed from 200 to 201 (should be 200)")
        
        return issues
    
    def compare_endpoint(self, path: str, old_path_data: Dict, new_path_data: Dict) -> List[str]:
        """Compare endpoint for critical behavior changes"""
        issues = []
        old_methods = {k: v for k, v in old_path_data.items() if k in ['get', 'post', 'put', 'delete', 'patch']}
        new_methods = {k: v for k, v in new_path_data.items() if k in ['get', 'post', 'put', 'delete', 'patch']}
        
        # Check for removed methods
        for method in old_methods.keys():
            if method not in new_methods:
                issues.append(f"⚠️ CRITICAL: {method.upper()} method was removed")
        
        # Compare existing methods
        for method in old_methods.keys():
            if method in new_methods:
                response_issues = self.compare_response_codes(
                    path, method, 
                    old_methods[method].get('responses', {}), 
                    new_methods[method].get('responses', {})
                )
                issues.extend([f"{method.upper()}: {issue}" for issue in response_issues])
        
        return issues
```

#### Step 2: Configure Filtering Rules

Define what to ignore vs. what constitutes critical changes:

**Ignore (Non-Critical):**
- Operation ID changes (`listResources` → `Resources_list`)
- Added error response codes (401, 404, 403)
- OpenAPI version changes (3.0.3 → 3.0.0)
- Schema reference style changes (inline → `$ref`)
- Added tags for organization

**Critical (Must Fix):**
- Status code changes (200 → 201)
- Removed endpoints or methods
- Removed response codes
- Schema structure changes
- Description content changes

#### Step 3: Run Focused Analysis

Execute the comparison focusing only on API behavior changes:

```bash
python3 focused_compare.py
```

This will generate focused reports identifying only critical issues that affect API behavior.

#### Step 4: Fix TypeSpec Models

For status code issues, update TypeSpec files:

```typescript
// Before (incorrect)
@post create(@body request: CreateRequest):
  { @statusCode statusCode: 201; @body response: Response; }

// After (correct)
@post create(@body request: CreateRequest):
  { @statusCode statusCode: 200; @body response: Response; }
```

#### Step 5: Verify Fixes

Re-run the focused comparison after TypeSpec recompilation to ensure all critical issues are resolved.

### Tools and Scripts for Automated Analysis

#### Required Dependencies
- Python 3.x
- PyYAML (`pip install pyyaml`)
- TypeSpec compiler (for regenerating specs)

#### Directory Structure for Analysis
```
temp/api-comparison/
├── compare_openapi.py          # Full comparison script
├── focused_compare.py          # Focused critical issues only
├── endpoints/                  # Individual endpoint analyses
├── summary.md                  # Comprehensive comparison report
├── focused-critical-issues.md  # Critical issues requiring fixes
└── status-code-fixes-needed.md # Status code specific fixes
```

#### Key Comparison Metrics
- **Endpoint count**: Total paths in both specs
- **Method coverage**: HTTP methods per endpoint
- **Response code alignment**: Status code consistency
- **Schema compatibility**: Request/response structure matching
- **Operation ID consistency**: (can be ignored for compatibility)

### Step 4: Document Findings

Create reports based on your analysis approach:

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

### For Gap Analysis (Approach A)
To identify missing elements in TypeSpec-generated specs:

1. Replace `{MANUAL_SPEC_PATH}` with the path to your manual OpenAPI spec
2. Replace `{AUTO_GENERATED_SPEC_PATH}` with the path to your TypeSpec-generated spec
3. Replace `{API_NAME}` with your API name (e.g., "Fabric API", "Calling API")
4. Replace `{SCRATCHPAD_OUTPUT_PATH}` with desired output path for the scratchpad file
5. Execute the analysis following the comprehensive methodology above

### For Compatibility Audit (Approach B)
To verify API behavior compatibility:

1. Create a `temp/api-comparison/` directory in your project
2. Copy the focused comparison script template from this prompt
3. Update the script with your specific spec paths
4. Run the focused comparison: `python3 focused_compare.py`
5. Review the generated reports for critical issues
6. Fix any status code or behavioral inconsistencies in TypeSpec files
7. Recompile TypeSpec and re-run comparison to verify fixes

## Example Usage: Fabric API Audit

Here's a real example of how this methodology was successfully applied to the Fabric API:

### Problem
The TypeSpec-generated Fabric API specification had status code inconsistencies - returning 201 instead of 200 for create operations.

### Solution Applied
1. **Created focused comparison script** at `temp/fabric-api-comparison/focused_compare.py`
2. **Identified critical issues**: 9 endpoints returning 201 instead of 200
3. **Fixed TypeSpec files**: Updated 9 TypeSpec files to return 200 status codes
4. **Verified fixes**: Re-ran comparison showing 0 critical issues

### Files Updated
- `specs/signalwire-rest/fabric-api/conference-rooms/main.tsp`
- `specs/signalwire-rest/fabric-api/cxml-scripts/main.tsp`
- `specs/signalwire-rest/fabric-api/freeswitch-connectors/main.tsp`
- `specs/signalwire-rest/fabric-api/relay-applications/main.tsp`
- `specs/signalwire-rest/fabric-api/sip-endpoints/main.tsp`
- `specs/signalwire-rest/fabric-api/swml-scripts/main.tsp`
- `specs/signalwire-rest/fabric-api/resources/domain-applications/main.tsp`
- `specs/signalwire-rest/fabric-api/resources/phone-routes/main.tsp`
- `specs/signalwire-rest/fabric-api/resources/sip-endpoints/main.tsp`

### Results
- **Before**: 9 endpoints with critical status code issues
- **After**: 0 critical issues, full API behavior compatibility achieved
- **Ignored**: 67 operation ID changes (non-critical)
- **Ignored**: Added 401/404 error codes (enhancement, not breaking)

## Best Practices

### When to Use Each Approach
- **Gap Analysis (A)**: Building new TypeSpec implementations, missing functionality
- **Compatibility Audit (B)**: Verifying existing TypeSpec implementations, CI/CD validation

### Common Issues to Look For
1. **Status Code Changes**: 200 ↔ 201 for create operations
2. **Removed Endpoints**: Missing paths in generated spec
3. **Missing Parameters**: Required parameters not present
4. **Schema Mismatches**: Structure differences affecting API contracts
5. **Authentication Changes**: Security requirements not matching

### Automation Recommendations
- Integrate focused comparison into CI/CD pipeline
- Run compatibility audits before releases
- Set up alerts for critical API behavior changes
- Maintain separate scripts for different API families

The resulting analysis will provide actionable guidance for maintaining API compatibility while leveraging TypeSpec's benefits.