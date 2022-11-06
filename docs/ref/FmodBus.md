
`FmodBus() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html](https://www.fmod.com/docs/2.02/api/studio-api-bus.html)

---


## .is_valid(error) :id=is_valid

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_isvalid](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_isvalid)

---


## .get_id(out_guid, error) :id=get_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_guid = undefined` | `FMOD_GUID?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_GUID`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getid](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getid)

---


## .get_path(error) :id=get_path

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpath](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpath)

---


## .get_volume(out_struct, error) :id=get_volume

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getvolume](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getvolume)

---


## .set_volume(volume, error) :id=set_volume

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `volume` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setvolume](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setvolume)

---


## .get_paused(error) :id=get_paused

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpaused](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpaused)

---


## .set_paused(paused, error) :id=set_paused

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `paused` | `bool` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setpaused](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setpaused)

---


## .get_mute(error) :id=get_mute

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmute](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmute)

---


## .set_mute(mute, error) :id=set_mute

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `mute` | `bool` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setmute](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setmute)

---


## .stop_all_events(mode, error) :id=stop_all_events

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `mode` | `FMOD_STUDIO_STOP_MODE` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_stopallevents](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_stopallevents)

---


## .get_port_index(error) :id=get_port_index

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getportindex](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getportindex)

---


## .set_port_index(index, error) :id=set_port_index

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setportindex](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setportindex)

---


## .lock_channel_group(error) :id=lock_channel_group

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_lockchannelgroup](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_lockchannelgroup)

---


## .unlock_channel_group(error) :id=unlock_channel_group

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_unlockchannelgroup](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_unlockchannelgroup)

---


## .get_channel_group(out_channel_group, error) :id=get_channel_group

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_channel_group = undefined` | `FmodChannelGroup?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodChannelGroup`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getchannelgroup](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getchannelgroup)

---


## .get_cpu_usage(out_struct, error) :id=get_cpu_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getcpuusage](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getcpuusage)

---


## .get_memory_usage(out_usage, error) :id=get_memory_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_usage = undefined` | `FMOD_STUDIO_MEMORY_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_MEMORY_USAGE`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmemoryusage](https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmemoryusage)

---

