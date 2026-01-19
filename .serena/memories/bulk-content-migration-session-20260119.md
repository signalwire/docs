# Bulk Content Migration Session - 2026-01-19

## Current Status (after re-migration from fresh source)

### Completed
- ✅ Pulled fresh `/airlock/docs` main (Jan 18 with nko/endimg merged)
- ✅ Copied images: `fern/images/` (373 files)
- ✅ Migrated call-flow-builder (20 files)
- ✅ Migrated cantina (2 files)
- ✅ Migrated demos (15 files)
- ✅ Migrated platform (320 files)
- ✅ Generated platform.yml (732 lines)
- ✅ Created YAML configs for all products
- ✅ Fixed image paths to absolute `/images/`

### Still Needs Fixing
- ~13 files with `<div class=` tags (Docusaurus layout)
- ~29 files with `require()` image imports
- Some unclosed `:::` admonition tags

### Files with Issues (to fix manually or with targeted sed)
Run these to find them:
```bash
grep -r '<div' fern/products --include='*.mdx' -l
grep -r 'require(' fern/products --include='*.mdx' -l
grep -r '^:::$' fern/products --include='*.mdx' -l
```

---

## What Was Done (from stale source - REPLACED)