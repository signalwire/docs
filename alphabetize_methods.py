import yaml

# Read the current swml.yml
with open('fern/products/swml/swml.yml', 'r') as f:
    content = f.read()

# Parse YAML
data = yaml.safe_load(content)

# Find the Methods section in the reference tab
for tab in data['navigation']:
    if tab.get('tab') == 'reference':
        for section in tab['layout']:
            if section.get('section') == 'Methods':
                contents = section['contents']
                
                # Separate Overview (keep at top) from other items
                overview = None
                simple_pages = []
                nested_sections = []
                
                for item in contents:
                    if item.get('page') == 'Overview':
                        overview = item
                    elif 'section' in item:
                        nested_sections.append(item)
                    else:
                        simple_pages.append(item)
                
                # Sort simple pages alphabetically by page name
                simple_pages.sort(key=lambda x: x.get('page', '').lower())
                
                # Sort nested sections alphabetically by section name
                nested_sections.sort(key=lambda x: x.get('section', '').lower())
                
                # Combine: Overview first, then alphabetized simple pages, then alphabetized nested sections
                new_contents = []
                if overview:
                    new_contents.append(overview)
                new_contents.extend(simple_pages)
                new_contents.extend(nested_sections)
                
                section['contents'] = new_contents
                
                print("Methods section alphabetized!")
                print(f"Overview: 1")
                print(f"Simple pages: {len(simple_pages)}")
                print(f"Nested sections: {len(nested_sections)}")
                print("\nSimple pages order:")
                for p in simple_pages:
                    print(f"  - {p.get('page')}")
                print("\nNested sections order:")
                for s in nested_sections:
                    print(f"  - {s.get('section')}")

# Write back to file
with open('fern/products/swml/swml.yml', 'w') as f:
    yaml.dump(data, f, default_flow_style=False, sort_keys=False, allow_unicode=True)

print("\nswml.yml updated!")
