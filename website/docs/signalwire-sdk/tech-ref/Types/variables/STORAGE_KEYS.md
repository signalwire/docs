> `const` **STORAGE\_KEYS**: `object`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:335](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L335)

Storage keys used by the ClientFactory system

## Type declaration

### CONFIG

> `readonly` **CONFIG**: `"swcf:config"` = `'swcf:config'`

### CREDENTIALS()

> `readonly` **CREDENTIALS**: (`id`) => `string`

#### Parameters

##### id

`string`

#### Returns

`string`

### DEVICE\_REGISTRATION

> `readonly` **DEVICE\_REGISTRATION**: `"swcf:device:registration"` = `'swcf:device:registration'`

### INSTANCE\_STATE()

> `readonly` **INSTANCE\_STATE**: (`id`) => `string`

#### Parameters

##### id

`string`

#### Returns

`string`

### PROFILE()

> `readonly` **PROFILE**: (`id`) => `string`

#### Parameters

##### id

`string`

#### Returns

`string`

### PROFILES

> `readonly` **PROFILES**: `"swcf:profiles"` = `'swcf:profiles'`
