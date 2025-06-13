---
id: agents-sdk-skills-search-installation
slug: /agents-sdk/skills/search-installation
title: Search System Installation
sidebar_label: Search Installation
--- 

# SignalWire Agents Search Installation Guide

The SignalWire Agents SDK includes optional local search capabilities that can be installed separately to avoid adding large dependencies to the base installation.

## Which Installation Should I Choose?

### For Development and Testing
- **`search`** - Fast, lightweight, good for development and testing
- No additional setup required
- Best for: Local development, CI/CD, resource-constrained environments

### For Production with Document Processing
- **`search-full`** - Comprehensive document support without NLP overhead
- Handles PDF, DOCX, Excel, PowerPoint files
- Best for: Production systems that need document processing but prioritize speed

### For Advanced Search Quality
- **`search-nlp`** - Better search relevance with advanced query processing
- Requires spaCy model download: `python -m spacy download en_core_web_sm`
- 2-3x slower than basic search
- Best for: Applications where search quality is more important than speed

### For Everything
- **`search-all`** - Complete feature set
- Requires spaCy model download: `python -m spacy download en_core_web_sm`
- Largest installation, slowest performance
- Best for: Full-featured applications with powerful hardware

## Installation Options

### Basic Search
For vector embeddings and keyword search with minimal dependencies:

```bash
pip install signalwire-agents[search]
```

**Size:** ~500MB  
**Includes:** sentence-transformers, scikit-learn, nltk, numpy

### Full Document Processing
For comprehensive document processing including PDF, DOCX, Excel, PowerPoint:

```bash
pip install signalwire-agents[search-full]
```

**Size:** ~600MB  
**Includes:** Basic search + pdfplumber, python-docx, openpyxl, python-pptx, markdown, striprtf, python-magic

### Advanced NLP
For advanced natural language processing with spaCy:

```bash
pip install signalwire-agents[search-nlp]
```

**Size:** ~600MB  
**Includes:** Basic search + spaCy

**⚠️ Additional Setup Required:**
After installation, you must download the spaCy language model:

```bash
python -m spacy download en_core_web_sm
```

**Performance Note:** Advanced NLP features provide better query understanding and synonym expansion, but are significantly slower than basic search. You can control which NLP backend to use:

- **NLTK (default)**: Fast processing, good for most use cases
- **spaCy**: Better quality but 2-3x slower, requires model download

Use the `nlp_backend` parameter to choose:
```python
# Fast NLTK processing (default)
self.add_skill("native_vector_search", {
    "nlp_backend": "nltk"  # or omit for default
})

# Better quality spaCy processing
self.add_skill("native_vector_search", {
    "nlp_backend": "spacy"  # requires spaCy model download
})
```

### All Features
For complete search functionality:

```bash
pip install signalwire-agents[search-all]
```

**Size:** ~700MB  
**Includes:** All search features combined

**⚠️ Additional Setup Required:**
After installation, you must download the spaCy language model:

```bash
python -m spacy download en_core_web_sm
```

**Performance Note:** This includes advanced NLP features which are slower but provide better search quality.

You can control which NLP backend to use with the `nlp_backend` parameter:
- `"nltk"` (default): Fast processing
- `"spacy"`: Better quality but slower, requires model download

## Feature Comparison

| Feature | Basic | Full | NLP | All |
|---------|-------|------|-----|-----|
| Vector embeddings | ✅ | ✅ | ✅ | ✅ |
| Keyword search | ✅ | ✅ | ✅ | ✅ |
| Text files (txt, md) | ✅ | ✅ | ✅ | ✅ |
| PDF processing | ❌ | ✅ | ❌ | ✅ |
| DOCX processing | ❌ | ✅ | ❌ | ✅ |
| Excel/PowerPoint | ❌ | ✅ | ❌ | ✅ |
| Advanced NLP | ❌ | ❌ | ✅ | ✅ |
| POS tagging | ❌ | ❌ | ✅ | ✅ |
| Named entity recognition | ❌ | ❌ | ✅ | ✅ |

## Checking Installation

You can check if search functionality is available in your code:

```python
try:
    from signalwire_agents.search import IndexBuilder, SearchEngine
    print("✅ Search functionality is available")
except ImportError as e:
    print(f"❌ Search not available: {e}")
    print("Install with: pip install signalwire-agents[search]")
```

## Quick Start

Once installed, you can start using search functionality:

### 1. Build a Search Index

```bash
# Using the CLI tool with the comprehensive concepts guide
sw-search docs/signalwire_agents_concepts_guide.md --output concepts.swsearch

# Build from multiple sources (files and directories)
sw-search docs/signalwire_agents_concepts_guide.md examples README.md --file-types md,py,txt --output comprehensive.swsearch

# Traditional directory approach
sw-search ./docs --output knowledge.swsearch --file-types md,txt,pdf

# Or in Python
from signalwire_agents.search import IndexBuilder
from pathlib import Path

builder = IndexBuilder()
# Build from specific file
builder.build_index_from_sources(
    sources=[Path("docs/signalwire_agents_concepts_guide.md")],
    output_file="concepts.swsearch",
    file_types=['md']
)

# Build from multiple sources
builder.build_index_from_sources(
    sources=[Path("docs/signalwire_agents_concepts_guide.md"), Path("examples"), Path("README.md")],
    output_file="comprehensive.swsearch",
    file_types=['md', 'py', 'txt']
)
```

### 2. Search Documents

```python
from signalwire_agents.search import SearchEngine
from signalwire_agents.search.query_processor import preprocess_query

# Load search engine with concepts guide
engine = SearchEngine("concepts.swsearch")

# Preprocess query
enhanced = preprocess_query("How do I build agents?", vector=True)

# Search
results = engine.search(
    query_vector=enhanced['vector'],
    enhanced_text=enhanced['enhanced_text'],
    count=5
)

for result in results:
    print(f"Score: {result['score']:.2f}")
    print(f"File: {result['metadata']['filename']}")
    print(f"Content: {result['content'][:200]}...")
    print("---")
```

### 3. Use in an Agent

```python
from signalwire_agents import AgentBase
from signalwire_agents.core.function_result import SwaigFunctionResult

class SearchAgent(AgentBase):
    def __init__(self):
        super().__init__(name="search-agent")
        
        # Check if search is available
        try:
            from signalwire_agents.search import SearchEngine
            self.search_engine = SearchEngine("concepts.swsearch")
            self.search_available = True
        except ImportError:
            self.search_available = False
    
    @AgentBase.tool(
        name="search_knowledge",
        description="Search the knowledge base",
        parameters={
            "query": {"type": "string", "description": "Search query"}
        }
    )
    def search_knowledge(self, args, raw_data):
        if not self.search_available:
            return SwaigFunctionResult(
                "Search not available. Install with: pip install signalwire-agents[search]"
            )
        
        # Perform search...
        return SwaigFunctionResult("Search results...")
```

## Troubleshooting

### Common Issues

1. **ImportError: No module named 'sentence_transformers'**
   ```bash
   pip install signalwire-agents[search]
   ```

2. **ImportError: No module named 'pdfplumber'**
   ```bash
   pip install signalwire-agents[search-full]
   ```

3. **NLTK data not found**
   ```python
   import nltk
   nltk.download('punkt')
   nltk.download('averaged_perceptron_tagger')
   ```

4. **spaCy model not found**
   ```bash
   python -m spacy download en_core_web_sm
   ```
   
   If you see "spaCy model 'en_core_web_sm' not found. Falling back to NLTK", this means the spaCy language model wasn't installed. This is required for `search-nlp` and `search-all` installations.

5. **Large download sizes**
   - The sentence-transformers library downloads pre-trained models (~400MB)
   - This happens on first use and is cached locally
   - Use `search` instead of `search-all` if you don't need document processing

### Performance Tips

1. **Model Selection**: Use smaller models for faster inference:
   ```python
   builder = IndexBuilder(model_name='sentence-transformers/all-MiniLM-L6-v2')
   ```

2. **Chunk Size**: Adjust chunk size based on your documents:
   ```python
   builder = IndexBuilder(chunk_size=300, chunk_overlap=30)  # Smaller chunks
   ```

3. **File Filtering**: Only index relevant file types:
   ```python
   builder.build_index(
       source_dir="./docs",
       file_types=['md', 'txt'],  # Skip heavy formats like PDF
       exclude_patterns=['**/test/**', '**/__pycache__/**']
   )
   ```

## Uninstalling

To remove search dependencies:

```bash
pip uninstall sentence-transformers scikit-learn nltk
# Add other packages as needed
```

The core SignalWire Agents SDK will continue to work without search functionality.

## Support

For issues with search functionality:

1. Check the [GitHub Issues](https://github.com/signalwire/signalwire-ai-agents/issues)
2. Verify your Python version (3.7+ required)
3. Try reinstalling with `--force-reinstall`
4. Check available disk space (models require ~1GB total) 