---
title: "contexts"
---

# contexts

Contexts and Steps System for SignalWire Agents

This module provides an alternative to traditional POM-based prompts by allowing
agents to be defined as structured contexts with sequential steps. Each step
contains its own prompt, completion criteria, and function restrictions.

## Step

Represents a single step within a context

### Methods

#### set_text
```python
set_text(text: str)
```

Set the step's prompt text directly

Args:
    text: The prompt text for this step
    
Returns:
    Self for method chaining

#### add_section
```python
add_section(title: str, body: str)
```

Add a POM section to the step

Args:
    title: Section title
    body: Section body text
    
Returns:
    Self for method chaining

#### add_bullets
```python
add_bullets(title: str, bullets: List[str])
```

Add a POM section with bullet points

Args:
    title: Section title
    bullets: List of bullet points
    
Returns:
    Self for method chaining

#### set_step_criteria
```python
set_step_criteria(criteria: str)
```

Set the criteria for determining when this step is complete

Args:
    criteria: Description of step completion criteria
    
Returns:
    Self for method chaining

#### set_functions
```python
set_functions(functions: Union[str, List[str]])
```

Set which functions are available in this step

Args:
    functions: "none" to disable all functions, or list of function names
    
Returns:
    Self for method chaining

#### set_valid_steps
```python
set_valid_steps(steps: List[str])
```

Set which steps can be navigated to from this step

Args:
    steps: List of valid step names (include "next" for sequential flow)
    
Returns:
    Self for method chaining

#### set_valid_contexts
```python
set_valid_contexts(contexts: List[str])
```

Set which contexts can be navigated to from this step

Args:
    contexts: List of valid context names
    
Returns:
    Self for method chaining

#### set_reset_system_prompt
```python
set_reset_system_prompt(system_prompt: str)
```

Set system prompt for context switching when this step navigates to a context

Args:
    system_prompt: New system prompt for context switching
    
Returns:
    Self for method chaining

#### set_reset_user_prompt
```python
set_reset_user_prompt(user_prompt: str)
```

Set user prompt for context switching when this step navigates to a context

Args:
    user_prompt: User message to inject for context switching
    
Returns:
    Self for method chaining

#### set_reset_consolidate
```python
set_reset_consolidate(consolidate: bool)
```

Set whether to consolidate conversation when this step switches contexts

Args:
    consolidate: Whether to consolidate previous conversation
    
Returns:
    Self for method chaining

#### set_reset_full_reset
```python
set_reset_full_reset(full_reset: bool)
```

Set whether to do full reset when this step switches contexts

Args:
    full_reset: Whether to completely rewrite system prompt vs inject
    
Returns:
    Self for method chaining

#### to_dict
```python
to_dict()
```

Convert step to dictionary for SWML generation


## Context

Represents a single context containing multiple steps

### Methods

#### add_step
```python
add_step(name: str)
```

Add a new step to this context

Args:
    name: Step name
    
Returns:
    Step object for method chaining

#### set_valid_contexts
```python
set_valid_contexts(contexts: List[str])
```

Set which contexts can be navigated to from this context

Args:
    contexts: List of valid context names
    
Returns:
    Self for method chaining

#### set_post_prompt
```python
set_post_prompt(post_prompt: str)
```

Set post prompt override for this context

Args:
    post_prompt: Post prompt text to use when this context is active
    
Returns:
    Self for method chaining

#### set_system_prompt
```python
set_system_prompt(system_prompt: str)
```

Set system prompt for context switching (triggers context reset)

Args:
    system_prompt: New system prompt for when this context is entered
    
Returns:
    Self for method chaining

#### set_consolidate
```python
set_consolidate(consolidate: bool)
```

Set whether to consolidate conversation history when entering this context

Args:
    consolidate: Whether to consolidate previous conversation
    
Returns:
    Self for method chaining

#### set_full_reset
```python
set_full_reset(full_reset: bool)
```

Set whether to do full reset when entering this context

Args:
    full_reset: Whether to completely rewrite system prompt vs inject
    
Returns:
    Self for method chaining

#### set_user_prompt
```python
set_user_prompt(user_prompt: str)
```

Set user prompt to inject when entering this context

Args:
    user_prompt: User message to inject for context
    
Returns:
    Self for method chaining

#### set_isolated
```python
set_isolated(isolated: bool)
```

Set whether to truncate conversation history when entering this context

Args:
    isolated: Whether to truncate conversation on context switch
    
Returns:
    Self for method chaining

#### add_system_section
```python
add_system_section(title: str, body: str)
```

Add a POM section to the system prompt

Args:
    title: Section title
    body: Section body text
    
Returns:
    Self for method chaining

#### add_system_bullets
```python
add_system_bullets(title: str, bullets: List[str])
```

Add a POM section with bullet points to the system prompt

Args:
    title: Section title
    bullets: List of bullet points
    
Returns:
    Self for method chaining

#### set_prompt
```python
set_prompt(prompt: str)
```

Set the context's prompt text directly

Args:
    prompt: The prompt text for this context
    
Returns:
    Self for method chaining

#### add_section
```python
add_section(title: str, body: str)
```

Add a POM section to the context prompt

Args:
    title: Section title
    body: Section body text
    
Returns:
    Self for method chaining

#### add_bullets
```python
add_bullets(title: str, bullets: List[str])
```

Add a POM section with bullet points to the context prompt

Args:
    title: Section title
    bullets: List of bullet points
    
Returns:
    Self for method chaining

#### to_dict
```python
to_dict()
```

Convert context to dictionary for SWML generation


## ContextBuilder

Main builder class for creating contexts and steps

### Methods

#### add_context
```python
add_context(name: str)
```

Add a new context

Args:
    name: Context name
    
Returns:
    Context object for method chaining

#### validate
```python
validate()
```

Validate the contexts configuration

#### to_dict
```python
to_dict()
```

Convert all contexts to dictionary for SWML generation


## create_simple_context

```python
create_simple_context(name: str = 'default')
```

Helper function to create a simple single context

Args:
    name: Context name (defaults to "default")
    
Returns:
    Context object for method chaining

