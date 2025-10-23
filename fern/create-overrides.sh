#!/bin/bash
# Script to generate override files for all OpenAPI specs

set -e

echo "Creating override files for all specs..."
echo "=========================================="
echo ""

# Array of spec files and namespaces
specs=(
  "calling.yaml:Calling"
  "chat.yaml:Chat"
  "datasphere.yaml:Datasphere"
  "fabric.yaml:Fabric"
  "fax.yaml:Fax"
  "logs.yaml:Logs"
  "message.yaml:Message"
  "pubsub.yaml:Pubsub"
  "voice.yaml:Voice"
  "project-api.yaml:Project"
  "space-api.yaml:Space"
  "video-api.yaml:Video"
  "compatibility-api.yaml:Compatibility"
)

for spec_entry in "${specs[@]}"; do
  IFS=':' read -r spec_file namespace <<< "$spec_entry"
  spec_name="${spec_file%.yaml}"
  override_file="docs/openapi-specs/${spec_name}-overrides.yml"

  echo "Processing $spec_file ($namespace)..."

  # Create temporary generators.yml with only this spec
  cat > generators.yml << EOF
api:
  specs:
    - openapi: docs/openapi-specs/$spec_file
      namespace: $namespace
groups:
  ts-sdk:
    generators:
      - name: fernapi/fern-typescript-node-sdk
        version: 3.11.1
        output:
          location: npm
          package-name: signalwire-sdk
        config:
          namespaceExport: Signalwire
EOF

  # Generate overrides
  fern write-overrides > /dev/null 2>&1 || true

  # Move the generated file to the specific override file
  if [ -f "openapi-overrides.yml" ]; then
    mv openapi-overrides.yml "$override_file"
    echo "  ✓ Created $override_file"
  else
    echo "  ⚠ No overrides generated for $spec_file (creating empty file)"
    echo "# Overrides for $spec_file" > "$override_file"
  fi

  echo ""
done

echo "Restoring original generators.yml..."
if [ -f "generators.yml.backup" ]; then
  cp generators.yml.backup generators.yml
  echo "✓ Restored generators.yml"
else
  echo "⚠ Warning: backup not found"
fi

echo ""
echo "=========================================="
echo "Override files created!"
echo ""
echo "Generated overrides:"
ls -lh docs/openapi-specs/*-overrides.yml 2>/dev/null | awk '{print "  - " $9 " (" $5 ")"}'
