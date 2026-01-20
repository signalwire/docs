# Migration Scripts

Scripts for migrating Docusaurus content to Fern.

## convert-docusaurus-to-fern.sh

Converts a single Docusaurus MDX file to Fern MDX format.

### Usage

```bash
./convert-docusaurus-to-fern.sh <input.mdx> <output.mdx>
```

### Conversions

| Docusaurus | Fern |
|------------|------|
| `sidebar_position: N` | (removed) |
| `@image/path/img.png` | `images/path/img.png` |
| `:::tip` ... `:::` | `<Tip>` ... `</Tip>` |
| `:::note` ... `:::` | `<Note>` ... `</Note>` |
| `:::warning` ... `:::` | `<Warning>` ... `</Warning>` |
| `:::info` ... `:::` | `<Info>` ... `</Info>` |
| `:::caution` ... `:::` | `<Warning>` ... `</Warning>` |

### Example: Migrate call-flow-builder

```bash
# Set paths
SCRIPT=./tools/scripts/convert-docusaurus-to-fern.sh
SRC=/airlock/docs/website/docs/main/call-flow-builder
DST=./fern/products/call-flow-builder/pages

# Convert main files
$SCRIPT "$SRC/index.mdx" "$DST/index.mdx"
$SCRIPT "$SRC/variables/index.mdx" "$DST/variables.mdx"
$SCRIPT "$SRC/version/index.mdx" "$DST/version.mdx"

# Convert nodes
$SCRIPT "$SRC/nodes/index.mdx" "$DST/nodes/index.mdx"
for node in ai_agent answer_call conditions execute_swml forward_to_phone \
            gather_input handle_call hangup_call play_audio_or_tts request \
            send_sms set_variables start_call_recording stop_call_recording \
            unset_variables voicemail_recording; do
    $SCRIPT "$SRC/nodes/$node/index.mdx" "$DST/nodes/$node.mdx"
done
```

## migrate-call-flow-builder.sh

Batch script to migrate all call-flow-builder content.

```bash
./migrate-call-flow-builder.sh
```
