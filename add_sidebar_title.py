import os
import re
import yaml

def add_sidebar_title_to_file(filepath):
    """Add sidebar-title to frontmatter matching the title."""
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Check if file has frontmatter
    if not content.startswith('---'):
        return False, "No frontmatter"
    
    # Extract frontmatter
    parts = content.split('---', 2)
    if len(parts) < 3:
        return False, "Invalid frontmatter"
    
    frontmatter_str = parts[1]
    body = parts[2]
    
    try:
        frontmatter = yaml.safe_load(frontmatter_str)
    except yaml.YAMLError as e:
        return False, f"YAML error: {e}"
    
    if not frontmatter:
        return False, "Empty frontmatter"
    
    # Get title
    title = frontmatter.get('title')
    if not title:
        return False, "No title in frontmatter"
    
    # Check if sidebar-title already exists
    if 'sidebar-title' in frontmatter:
        if frontmatter['sidebar-title'] == title:
            return False, "sidebar-title already matches title"
        else:
            # Update sidebar-title to match title
            frontmatter['sidebar-title'] = title
    else:
        # Add sidebar-title
        frontmatter['sidebar-title'] = title
    
    # Rebuild frontmatter preserving order
    # We'll insert sidebar-title right after title
    lines = frontmatter_str.strip().split('\n')
    new_lines = []
    title_found = False
    sidebar_added = False
    
    for line in lines:
        new_lines.append(line)
        if line.startswith('title:') and not sidebar_added:
            title_found = True
            # Add sidebar-title after title
            new_lines.append(f'sidebar-title: {title}')
            sidebar_added = True
        elif line.startswith('sidebar-title:'):
            # Remove old sidebar-title line and replace
            new_lines.pop()  # Remove the line we just added
            new_lines.append(f'sidebar-title: {title}')
            sidebar_added = True
    
    if not sidebar_added and title_found:
        # Title was found but sidebar-title wasn't added (shouldn't happen)
        new_lines.append(f'sidebar-title: {title}')
    
    new_frontmatter = '\n'.join(new_lines)
    new_content = f'---\n{new_frontmatter}\n---{body}'
    
    with open(filepath, 'w') as f:
        f.write(new_content)
    
    return True, f"Added sidebar-title: {title}"

# Find all method docs
methods_dir = 'fern/products/swml/pages/reference/methods'
updated = 0
skipped = 0

for root, dirs, files in os.walk(methods_dir):
    for file in files:
        if file.endswith('.mdx'):
            filepath = os.path.join(root, file)
            success, msg = add_sidebar_title_to_file(filepath)
            if success:
                print(f"Updated: {filepath} - {msg}")
                updated += 1
            else:
                print(f"Skipped: {filepath} - {msg}")
                skipped += 1

print(f"\nTotal updated: {updated}")
print(f"Total skipped: {skipped}")
