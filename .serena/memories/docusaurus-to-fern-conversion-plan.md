# Docusaurus → Fern Conversion Plan

## After Reset: Targeted Fixes Only

### 1. Safe Global Replacements
```bash
# className → class (safe, no collateral damage)
find fern/products/ -name "*.mdx" -exec sed -i 's/className=/class=/g' {} \;

# Tooltips → Tooltip (Fern's component)
find fern/products/ -name "*.mdx" -exec sed -i 's/<Tooltips/<Tooltip/g; s/<\/Tooltips>/<\/Tooltip>/g' {} \;
```

### 2. Remove Docusaurus Imports (line-by-line, safe)
```bash
# Remove import lines only (not content)
find fern/products/ -name "*.mdx" -exec sed -i '/^import.*@site/d' {} \;
find fern/products/ -name "*.mdx" -exec sed -i '/^import.*from.*react-icons/d' {} \;
find fern/products/ -name "*.mdx" -exec sed -i '/^import.*@theme/d' {} \;
```

### 3. Manual Rewrites (5 files)
These files have JSX that needs manual conversion:
- `overview/_products.mdx` - convert export/map to static Cards
- `overview/_tools.mdx` - convert export/map to static Cards  
- `platform/sdks-overview.mdx` - remove icon props, fix Card syntax
- `overview/homepage.mdx` - DELETE (rebuilding from scratch)
- `overview/_usecases/*/_CallFlow.mdx` (6 files) - convert JSX img to markdown

### 4. Copy Images
```bash
mkdir -p fern/images/img/cfb
cp /airlock/docs/website/static/img/ai-agent.svg fern/images/img/
cp /airlock/docs/website/static/img/cfb/*.webp fern/images/img/cfb/
```

### 5. Update Image Paths (CAREFUL - only specific pattern)
```bash
# Only update paths that start with /img/ (not code examples)
find fern/products/ -name "*.mdx" -exec sed -i 's|](/img/|](/images/img/|g' {} \;
find fern/products/ -name "*.mdx" -exec sed -i 's|src="/img/|src="/images/img/|g' {} \;
```

### 6. Remove platform.yml Overview Tab
Edit `fern/products/platform/platform.yml` to remove the overview tab that references deleted homepage.

## DO NOT DO
- `sed 's|"}||g'` - breaks code examples
- `sed 's|")||g'` - breaks prose and code
- Any global replacement involving quotes + special chars

## Test
Run `fern docs dev` after each major step to catch errors early.
