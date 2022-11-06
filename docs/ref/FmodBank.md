
`FmodBank() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html)

---


## .is_valid(error) :id=is_valid

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_isvalid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_isvalid)

---


## .get_id(out_guid, error) :id=get_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_guid` | `FMOD_GUID?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_GUID`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getid)

---


## .get_path(error) :id=get_path

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getpath](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getpath)

---


## .unload(error) :id=unload

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_unload](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_unload)

---


## .load_sample_data(error) :id=load_sample_data

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_loadsampledata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_loadsampledata)

---


## .unload_sample_data(error) :id=unload_sample_data

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_unloadsampledata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_unloadsampledata)

---


## .get_loading_state(error) :id=get_loading_state

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_LOADING_STATE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getloadingstate](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getloadingstate)

---


## .get_sample_loading_state(error) :id=get_sample_loading_state

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_LOADING_STATE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getsampleloadingstate](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getsampleloadingstate)

---


## .get_string_count(error) :id=get_string_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getstringcount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getstringcount)

---


## .get_string_info(index, out_guid, error) :id=get_string_info

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `out_guid = undefined` | `FMOD_GUID?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getstringinfo](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getstringinfo)

---


## .get_event_count(error) :id=get_event_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_geteventcount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_geteventcount)

---


## .get_event_list(error) :id=get_event_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventDescription[]`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_geteventlist](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_geteventlist)

---


## .get_bus_count(error) :id=get_bus_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getbuscount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getbuscount)

---


## .get_bus_list(error) :id=get_bus_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBus[]`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getbuslist](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getbuslist)

---


## .get_vca_count(error) :id=get_vca_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getvcacount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getvcacount)

---


## .get_vca_list(error) :id=get_vca_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodVca[]`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getvcalist](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getvcalist)

---


## ._get_user_data() :id=_get_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_getuserdata)

---


## ._set_user_data() :id=_set_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_setuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-bank.html#studio_bank_setuserdata)

---
