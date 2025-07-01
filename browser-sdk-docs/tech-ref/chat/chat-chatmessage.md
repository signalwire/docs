---
title: "ChatMessage"
slug: /chat/message
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

Accesses the channel in which this message was sent.

**Syntax:** `ChatMessage.channel()`

**Returns:** `string`

---

### content

Accesses the content of this message. This can be any JSON-serializable object or value.

**Syntax:** `ChatMessage.content()`

**Returns:** `string`

---

### id

Accesses the id of this message.

**Syntax:** `ChatMessage.id()`

**Returns:** `string`

---

### member

Accesses the member which sent this message.

**Syntax:** `ChatMessage.member()`

**Returns:** [`ChatMember`](/sdks/browser-sdk/chat/member)

---

### meta

Accesses any metadata associated with this message.

**Syntax:** `ChatMessage.meta()`

**Returns:** `any`

---

### publishedAt

Accesses the date and time at which this message was published.

**Syntax:** `ChatMessage.publishedAt()`

**Returns:** `Date`
