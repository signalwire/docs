# `<sw-prompt>` / `showPrompt()`

Confirm/alert dialog. Use the element directly or the `showPrompt` helper.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `title` | `string` | — | Dialog heading |
| `description` | `string` | `''` | Body text (or use default slot) |
| `type` | `'confirm' \| 'alert'` | `'confirm'` | `confirm` shows Accept/Reject; `alert` shows OK |

## Methods

| method | returns | description |
|--------|---------|-------------|
| `show()` | `Promise<boolean>` | Open and await user choice |

## Helper function

```ts
import { showPrompt } from '@signalwire/web-components';

const ok = await showPrompt({ title: 'Delete?', type: 'confirm' });
```

## Slots

| slot | description |
|------|-------------|
| *(default)* | Body content (falls back to `description` prop) |
