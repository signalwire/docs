> **VideoPositions** = `Record`\<`string`, [`VideoPosition`](VideoPosition.md)\>

Defined in: [packages/core/src/types/video.ts:87](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/video.ts#L87)

An object whose keys represent member IDs, and values are chosen from
[VideoPosition](VideoPosition.md). Instead of a member ID, in some contexts you can use
the special keyword `self` if you don't know yet the ID of the member which
is going to be created.

For example:

```js
{
  "1bf4d4fb-a3e4-4d46-80a8-3ebfdceb2a60": "reserved-1",
  "e0c5be44-d6c7-438f-8cda-f859a1a0b1e7": "auto"
}
```

Or:

```js
{
  "self": "reserved-1"
}
```
