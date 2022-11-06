
`FMOD_GUID() constructor`

**Parameters:**

(none)

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_guid](https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_guid)

---


### `.toString() :id=toString`

**Parameters:**

(none)

**Returns:** `string`



<br/><br/>

---


`FMOD_GUID FMOD_GUID_from_string(string guid_string, FMOD_GUID out_guid, FmlError? error)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid_string` | `string` |  |
  | `out_guid = undefined` | `FMOD_GUID` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_GUID`



<br/><br/>

---

`void FMOD_GUID_serialize(FMOD_GUID guid, buffer buf)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `buf` | `buffer` |  |

**Returns:** `void`



<br/><br/>

---

`void FMOD_GUID_deserialize(FMOD_GUID guid, buffer buf)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `buf` | `buffer` |  |

**Returns:** `void`



<br/><br/>

---

`pointer FMOD_GUID_as_buf_ptr(FMOD_GUID guid)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |

**Returns:** `pointer`



<br/><br/>

---
