# Migration to Domain-Focused Architecture

## 🎯 **Objective**
Migrate from the current functional structure to a domain-focused architecture that better aligns with the mental model of the HTML→Markdown→llms.txt pipeline workflow.

---

## 📁 **Current Structure Analysis**

### **Current Structure (28 files, well-organized):**
```
src/
├── index.ts                         # Main plugin entry point
├── constants.ts                     # Centralized constants
│
├── cli/                            # 🔧 Command Line Interface
│   └── command.ts                  # CLI commands (generate + cleanup)
│
├── config/                         # ⚙️ Configuration Processing  
│   └── options.ts                  # Plugin options validation & processing
│
├── conversion/                     # 🔄 HTML → Markdown Pipeline
│   ├── htmlToMd.ts                # Main HTML to Markdown conversion
│   ├── markdown-renderer.ts       # Tree to Markdown rendering (llms.txt)
│   ├── markdownPipeline.ts        # Unified processor pipeline builder
│   ├── markdownPlugins.ts         # Plugin default configurations
│   ├── plugin-registry.ts         # Type-safe plugin registry system
│   ├── rehypeTables.ts            # Custom rehype plugin for tables
│   └── title-extractors.ts        # Title extraction strategy pattern
│
├── fs/                             # 📁 File System Operations
│   ├── atomic.ts                   # Atomic JSON file operations
│   ├── cache.ts                    # Cache management (load/save/hash)
│   ├── file-cleaner.ts            # Generated file cleanup
│   ├── path.ts                     # Path utilities & transformations
│   ├── walk.ts                     # Directory traversal for HTML files
│   └── write.ts                    # File writing operations
│
├── logging/                        # 📝 Logging System
│   └── logger.ts                   # Factory-based logger (no singletons)
│
├── processing/                     # ⚡ Core Processing Logic
│   ├── processor.ts                # Main orchestration (streamlined)
│   ├── file-processor.ts          # Single HTML file processing  
│   └── tree-builder.ts            # Document tree building
│
├── types/                          # 🏷️ TypeScript Definitions
│   ├── index.ts                    # Central type exports
│   ├── fs.ts                       # File system types
│   ├── logging.ts                  # Logging interfaces
│   ├── plugin.ts                   # Core plugin types & schemas
│   └── unified.ts                  # Unified processor types
│
└── utils/                          # 🛠️ Utility Functions
    ├── errors.ts                   # Typed error handling system
    └── url.ts                      # URL formatting utilities
```

### **Current Structure Issues:**
1. **Boundary confusion**: `processing/` vs `conversion/` - where does each step belong?
2. **Split workflow**: HTML processing pipeline is scattered across two directories
3. **File system complexity**: 6 files in `fs/` with mixed concerns
4. **Naming clarity**: Some file names don't clearly indicate their purpose

---

## 🎨 **Proposed Domain-Focused Structure**

### **Improved Target Structure:**
```
src/
├── index.ts                          # Main plugin entry point
├── constants.ts                      # Centralized constants (cross-cutting)
│
├── pipeline/                         # 🚀 Unified Processing Pipeline
│   ├── orchestrator.ts              # processor.ts → main workflow coordination
│   ├── html-processor.ts            # file-processor.ts → single file processing
│   ├── html-converter.ts            # htmlToMd.ts → HTML to Markdown conversion
│   ├── pipeline-builder.ts          # markdownPipeline.ts → unified pipeline setup
│   ├── tree-builder.ts              # document tree building from processed docs
│   ├── markdown-renderer.ts         # tree to markdown rendering (llms.txt output)
│   ├── title-extractors.ts          # title extraction strategies
│   ├── plugin-registry.ts           # type-safe plugin registry system
│   ├── plugins.ts                   # markdownPlugins.ts → plugin configurations
│   └── rehype-tables.ts             # custom rehype plugin for tables
│
├── filesystem/                      # 📁 File System Operations
│   ├── io/                          # Input/Output operations
│   │   ├── read.ts                  # walk.ts → directory traversal & reading
│   │   ├── write.ts                 # file writing operations (unchanged)
│   │   └── atomic.ts                # atomic file operations (unchanged)
│   ├── cache/                       # Cache management
│   │   ├── manager.ts               # cache.ts → cache CRUD operations
│   │   └── cleaner.ts               # file-cleaner.ts → cleanup operations
│   └── path.ts                      # path utilities (unchanged)
│
├── cli/                             # 🔧 Command Line Interface (unchanged)
│   └── command.ts                   # CLI commands (generate + cleanup)
│
├── config/                          # ⚙️ Configuration (unchanged)
│   └── options.ts                   # Plugin options validation & processing
│
├── logging/                         # 📝 Logging System (unchanged)
│   └── logger.ts                    # Factory-based logger
│
├── types/                           # 🏷️ TypeScript Definitions (unchanged)
│   ├── index.ts                     # Central type exports
│   ├── fs.ts                        # File system types
│   ├── logging.ts                   # Logging interfaces
│   ├── plugin.ts                    # Core plugin types & schemas
│   └── unified.ts                   # Unified processor types
│
└── utils/                           # 🛠️ Utility Functions (unchanged)
    ├── errors.ts                    # Typed error handling system
    └── url.ts                       # URL formatting utilities
```

### **Key Improvements:**
1. **🚀 Unified Pipeline**: All HTML→Markdown→Tree→Output logic in one place
2. **📁 Organized Filesystem**: Logical grouping - `io/` (read/write), `cache/` (management)
3. **🏷️ Clear Naming**: File names directly indicate their role in the workflow
4. **🧠 Mental Model Alignment**: Structure matches actual data flow
5. **✅ Preserves What Works**: Keeps excellent `types/`, `utils/`, `cli/`, `config/`, `logging/`

---

## 🔄 **Migration Plan**

### **Phase 1: Prepare New Structure (No Logic Changes)**
**Goal:** Create new directories and move files without breaking anything

#### **1.1 Create New Directories**
- [ ] Create `src/pipeline/` directory
- [ ] Create `src/filesystem/` directory
- [ ] Create `src/filesystem/io/` subdirectory
- [ ] Create `src/filesystem/cache/` subdirectory

#### **1.2 Move Files to New Locations**
- [ ] Move `processing/processor.ts` → `pipeline/orchestrator.ts`
- [ ] Move `processing/file-processor.ts` → `pipeline/html-processor.ts`
- [ ] Move `processing/tree-builder.ts` → `pipeline/tree-builder.ts`
- [ ] Move `conversion/htmlToMd.ts` → `pipeline/html-converter.ts`
- [ ] Move `conversion/markdown-renderer.ts` → `pipeline/markdown-renderer.ts`
- [ ] Move `conversion/markdownPipeline.ts` → `pipeline/pipeline-builder.ts`
- [ ] Move `conversion/markdownPlugins.ts` → `pipeline/plugins.ts`
- [ ] Move `conversion/plugin-registry.ts` → `pipeline/plugin-registry.ts`
- [ ] Move `conversion/rehypeTables.ts` → `pipeline/rehype-tables.ts`
- [ ] Move `conversion/title-extractors.ts` → `pipeline/title-extractors.ts`
- [ ] Move `fs/walk.ts` → `filesystem/io/read.ts`
- [ ] Move `fs/write.ts` → `filesystem/io/write.ts`
- [ ] Move `fs/atomic.ts` → `filesystem/io/atomic.ts`
- [ ] Move `fs/cache.ts` → `filesystem/cache/manager.ts`
- [ ] Move `fs/file-cleaner.ts` → `filesystem/cache/cleaner.ts`
- [ ] Move `fs/path.ts` → `filesystem/path.ts`

#### **1.3 Update All Import Statements**
- [ ] Update imports in `index.ts`
- [ ] Update imports in `cli/command.ts`
- [ ] Update imports in `config/options.ts`
- [ ] Update imports in all pipeline files
- [ ] Update imports in all filesystem files
- [ ] Update imports in utils and types

#### **1.4 Remove Empty Directories**
- [ ] Remove empty `src/processing/` directory
- [ ] Remove empty `src/conversion/` directory  
- [ ] Remove empty `src/fs/` directory

### **Phase 2: Validate Migration**
**Goal:** Ensure everything still works correctly

#### **2.1 Build and Test**
- [ ] Run `npm run build` to verify TypeScript compilation
- [ ] Run `npm run lint` to check for any issues
- [ ] Test CLI command: `npm run docusaurus llms-txt`
- [ ] Test cleanup command: `npm run docusaurus llms-txt-clean`
- [ ] Verify plugin integration in a test Docusaurus site

#### **2.2 Verify Functionality**
- [ ] Check HTML file processing works correctly
- [ ] Verify Markdown generation functions properly
- [ ] Confirm llms.txt output is generated correctly
- [ ] Test caching system still functions
- [ ] Validate cleanup operations work properly

### **Phase 3: Documentation Updates**
**Goal:** Update documentation to reflect new structure

#### **3.1 Update Code Comments**
- [ ] Update JSDoc comments in moved files
- [ ] Update internal references to file locations
- [ ] Update any embedded file path examples

#### **3.2 Update External Documentation**
- [ ] Update README.md if it references file structure
- [ ] Update any development documentation
- [ ] Update package.json scripts if they reference specific files

---

## 📊 **Migration Benefits**

### **Before Migration:**
- ❓ **Confusion**: Processing vs conversion boundaries unclear
- 🔀 **Scattered**: Pipeline logic split across two directories
- 📁 **Mixed concerns**: File operations mixed in one directory
- 🏷️ **Generic names**: File names don't indicate workflow role

### **After Migration:**
- ✅ **Clarity**: Single `pipeline/` directory for entire workflow
- 🎯 **Focused**: Each directory has a clear domain purpose
- 📁 **Organized**: File operations logically grouped (io/, cache/)
- 🏷️ **Descriptive**: File names clearly indicate their role in workflow

### **Workflow Alignment:**
```
HTML Files → pipeline/orchestrator.ts
    ↓
Single File → pipeline/html-processor.ts
    ↓
HTML Content → pipeline/html-converter.ts (via pipeline/pipeline-builder.ts)
    ↓
Document Info → pipeline/tree-builder.ts
    ↓
Tree Structure → pipeline/markdown-renderer.ts
    ↓
llms.txt Output
```

---

## ⚠️ **Migration Risks & Mitigations**

### **Risk: Import Statement Errors**
- **Mitigation**: Update all imports systematically in Phase 1.3
- **Validation**: TypeScript compilation will catch any missing imports

### **Risk: Circular Dependencies**
- **Mitigation**: The new structure maintains the same dependency flow
- **Validation**: Build process will detect any circular imports

### **Risk: External References**
- **Mitigation**: This is an internal refactoring - no public API changes
- **Validation**: Plugin interface remains identical

### **Risk: Development Disruption**
- **Mitigation**: Migration can be done in a feature branch
- **Validation**: Full testing before merging to main

---

## 🎯 **Success Criteria**

- ✅ **All files moved** to appropriate new locations
- ✅ **Zero compilation errors** after migration
- ✅ **All functionality preserved** - no behavior changes
- ✅ **CLI commands work** exactly as before
- ✅ **Plugin integration unchanged** - no breaking changes
- ✅ **Improved developer experience** - easier to navigate and understand
- ✅ **Clear mental model** - structure matches workflow

---

## 🚀 **Implementation Timeline**

**Estimated effort:** 2-4 hours for complete migration

- **Phase 1:** 1-2 hours (file moves and import updates)
- **Phase 2:** 30 minutes (validation and testing)  
- **Phase 3:** 30 minutes (documentation updates)

**Recommended approach:** Execute as a single atomic change in a feature branch to avoid incomplete states.

---

## 💡 **Future Benefits**

This domain-focused structure will make the codebase more:
- **Intuitive** for new developers to understand
- **Maintainable** with clear separation of concerns
- **Extensible** for future pipeline enhancements
- **Debuggable** with logical workflow organization

