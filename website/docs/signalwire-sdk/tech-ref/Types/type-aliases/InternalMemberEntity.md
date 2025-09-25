> **InternalMemberEntity** = `{ [K in NonNullable<keyof MemberEntity> as CamelToSnakeCase<K>]: MemberEntity[K] }`

Defined in: [packages/core/src/types/fabricMember.ts:115](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricMember.ts#L115)

**`Internal`**

MemberEntity entity for internal usage (converted to snake_case)
