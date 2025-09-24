> **InternalVideoLayout** = `{ [K in Exclude<keyof VideoLayout, "layers"> as CamelToSnakeCase<K>]: VideoLayout[K] }` & `object`

Defined in: [packages/core/src/types/videoLayout.ts:57](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/videoLayout.ts#L57)

## Type declaration

### layers

> **layers**: `InternalVideoLayoutLayer`[]
