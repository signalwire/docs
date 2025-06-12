---
title: "ChatMessage"
---

Represents a message in a chat.

## Constructors

### constructor

• **new ChatMessage**(`payload`)

#### Parameters

| Name      | Type          |
| :-------- | :------------ |
| `payload` | `ChatMessage` |

## Properties

### channel

The channel in which this message was sent.

**Syntax:** `ChatMessage.channel()`

**Returns:** `string`

---

### content

The content of this message. This can be any JSON-serializable object or value.

#### Returns

**Syntax:** `ChatMessage.content()`

**Returns:** `any`

---

### id

The id of this message.

**Syntax:** `ChatMessage.id()`

**Returns:** `string`

---

### member

The member which sent this message.

**Syntax:** `ChatMessage.member()`

**Returns:** [`ChatMember`](./chat-chatmember.md)

---

### meta

Any metadata associated to this message.

**Syntax:** `ChatMessage.meta()`

**Returns:** `any`

---

### publishedAt

The date and time at which this message was published.

**Syntax:** `ChatMessage.publishedAt()`

**Returns:** `Date`
