# WebP Conversion and Management Scripts

A collection of scripts for managing image formats in the documentation repository.

## Scripts

### `normalize_webp_case.sh`

**Git-aware** script that normalizes WebP extensions to lowercase.

**What it does:**

- Renames `.webP` (mixed case) to `.webp` (lowercase)
- Uses two-step `git mv` to ensure changes register on macOS
- Stages changes in git automatically

**Usage:**

```bash
./normalize_webp_case.sh <target_directory>
```

**Example:**

```bash
./normalize_webp_case.sh ../../images
git status  # Review changes
git commit -m "Normalize WebP extensions to lowercase"
```

**Why separate script?**

macOS uses a case-insensitive filesystem, so renaming `file.webP` → `file.webp` doesn't register in git without a two-step process. This script handles that properly.

---

### `convert_and_normalize.sh`

Normalizes WebP extensions and converts PNG files to WebP format.

**What it does:**

- Renames `.webP` (mixed case) to `.webp` (lowercase) - **filesystem only**
- Converts `.png` files to `.webp` (keeps originals)
- Uses 90% quality for conversions

**Usage:**

```bash
./convert_and_normalize.sh <target_directory>
```

**Example:**

```bash
./convert_and_normalize.sh ../../images
```

**Requirements:**

- `cwebp` tool (install via `brew install webp` on macOS)

---

### `delete_pngs.sh`

Recursively deletes all PNG files from a directory.

**What it does:**

- Finds and permanently deletes all `.png` files
- Requires typing "DELETE" to confirm (extra safety)

**Usage:**

```bash
./delete_pngs.sh <target_directory>
```

**Example:**

```bash
./delete_pngs.sh ../../images
```

**⚠️ Warning:** This permanently deletes files. Use after converting PNGs to WebP.

---

## Typical Workflow

### Full conversion workflow

1. **Convert PNGs to WebP:**

   ```bash
   ./convert_and_normalize.sh ../../images
   ```

2. **Review the conversions** to ensure quality is acceptable

3. **Delete original PNGs** (optional):

   ```bash
   ./delete_pngs.sh ../../images
   ```

### Git case normalization workflow

If you need to normalize existing `.webP` files for git on macOS:

```bash
./normalize_webp_case.sh ../../images
git status  # Review changes
git commit -m "Normalize WebP extensions to lowercase"
```

## Safety Features

All scripts include:

- Directory validation
- File count preview
- Confirmation prompts
- Absolute path display
- Error handling and reporting
- Summary statistics
- Git integration (normalize_webp_case.sh only)
