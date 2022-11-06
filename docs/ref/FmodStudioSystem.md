
`FmodStudioSystem() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html)

---


## .set_advanced_settings(settings, error) :id=set_advanced_settings

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `settings` | `FMOD_STUDIO_ADVANCEDSETTINGS` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setadvancedsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setadvancedsettings)

---


## .get_advanced_settings(out_settings, error) :id=get_advanced_settings

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_settings = undefined` | `FMOD_STUDIO_ADVANCEDSETTINGS?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_ADVANCEDSETTINGS`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getadvancedsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getadvancedsettings)

---


## .initialize(max_channels, studio_flags, core_flags, error) :id=initialize

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `max_channels` | `int` |  |
  | `studio_flags` | `int` | A bitmask of FMOD_STUDIO_INIT_xx values. |
  | `core_flags` | `int` | A bitmask of FMOD_INIT_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_initialize](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_initialize)

---


## .release(error) :id=release

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_release](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_release)

---


## .is_valid(error) :id=is_valid

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_isvalid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_isvalid)

---


## .update(error) :id=update

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_update](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_update)

---


## .flush_commands(error) :id=flush_commands

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_flushcommands](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_flushcommands)

---


## .flush_sample_loading(error) :id=flush_sample_loading

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_flushsampleloading](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_flushsampleloading)

---


## .get_core_system(out_system, error) :id=get_core_system

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_system = undefined` | `FmodSystem` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodSystem`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getcoresystem](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getcoresystem)

---


## .get_event(path, out_event_description, error) :id=get_event

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `path` | `string` |  |
  | `out_event_description = undefined` | `FmodEventDescription?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventDescription`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getevent](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getevent)

---


## .get_bus(path, out_bus, error) :id=get_bus

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `path` | `string` |  |
  | `out_bus = undefined` | `FmodBus?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBus`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbus](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbus)

---


## .get_vca(path, out_vca, error) :id=get_vca

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `path` | `string` |  |
  | `out_vca = undefined` | `FmodVca?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodVca`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getvca](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getvca)

---


## .get_bank(path, out_bank, error) :id=get_bank

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `path` | `string` |  |
  | `out_bank = undefined` | `FmodBank?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbank](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbank)

---


## .get_event_by_id(guid, out_event_description, error) :id=get_event_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `out_event_description = undefined` | `FmodEventDescription?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventDescription`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_geteventbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_geteventbyid)

---


## .get_bus_by_id(guid, out_bus, error) :id=get_bus_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `out_bus = undefined` | `FmodBus?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBus`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbusbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbusbyid)

---


## .get_vca_by_id(guid, out_vca, error) :id=get_vca_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `out_vca = undefined` | `FmodVca?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodVca`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getvcabyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getvcabyid)

---


## .get_bank_by_id(guid, out_bank, error) :id=get_bank_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `out_bank = undefined` | `FmodBank?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbankbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbankbyid)

---


## ._get_sound_info() :id=_get_sound_info

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getsoundinfo](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getsoundinfo)

---


## .get_parameter_description_by_name(name, out_description, error) :id=get_parameter_description_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_description = undefined` | `FMOD_STUDIO_PARAMETER_DESCRIPTION?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionbyname)

---


## .get_parameter_description_by_id(param_id, out_description, error) :id=get_parameter_description_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `param_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `out_description = undefined` | `FMOD_STUDIO_PARAMETER_DESCRIPTION?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionbyid)

---


## .get_parameter_label_by_name(name, label_index, error) :id=get_parameter_label_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `label_index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterlabelbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterlabelbyname)

---


## .get_parameter_label_by_id(parameter_id, label_index, error) :id=get_parameter_label_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `label_index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterlabelbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterlabelbyid)

---


## .get_parameter_by_id(parameter_id, out_struct, error) :id=get_parameter_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterbyid)

---


## .set_parameter_by_id(parameter_id, value, ignore_seek_speed, error) :id=set_parameter_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `value` | `number` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyid)

---


## .set_parameter_by_id_with_label(parameter_id, label, ignore_seek_speed, error) :id=set_parameter_by_id_with_label

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `label` | `string` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyidwithlabel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyidwithlabel)

---


## .set_parameters_by_ids(parameter_ids, values, ignore_seek_speed, error) :id=set_parameters_by_ids

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_ids` | `FMOD_STUDIO_PARAMETER_ID[]` |  |
  | `values` | `number[]` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparametersbyids](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparametersbyids)

---


## .get_parameter_by_name(name, out_struct, error) :id=get_parameter_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterbyname)

---


## .set_parameter_by_name(name, value, ignore_seek_speed, error) :id=set_parameter_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `value` | `number` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbyname)

---


## .set_parameter_by_name_with_label(name, label, ignore_seek_speed, error) :id=set_parameter_by_name_with_label

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `label` | `string` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbynamewithlabel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setparameterbynamewithlabel)

---


## .lookup_id(path, out_guid, error) :id=lookup_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `path` | `string` |  |
  | `out_guid = undefined` | `FMOD_GUID?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_GUID`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_lookupid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_lookupid)

---


## .lookup_path(guid, error) :id=lookup_path

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `guid` | `FMOD_GUID` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_lookuppath](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_lookuppath)

---


## .get_num_listeners(error) :id=get_num_listeners

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getnumlisteners](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getnumlisteners)

---


## .set_num_listeners(num_listeners, error) :id=set_num_listeners

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `num_listeners` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setnumlisteners](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setnumlisteners)

---


## .get_listener_attributes(listener, out_attributes, out_attenuation_position, error) :id=get_listener_attributes

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `listener` | `int` |  |
  | `out_attributes = undefined` | `FMOD_3D_ATTRIBUTES?` |  |
  | `out_attenuation_position = undefined` | `FMOD_VECTOR?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_3D_ATTRIBUTES`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getlistenerattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getlistenerattributes)

---


## .set_listener_attributes(listener, attributes, attenuation_position, error) :id=set_listener_attributes

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `listener` | `int` |  |
  | `attributes` | `FMOD_3D_ATTRIBUTES` |  |
  | `attenuation_position` | `FMOD_VECTOR?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setlistenerattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setlistenerattributes)

---


## .get_listener_weight(listener, error) :id=get_listener_weight

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `listener` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getlistenerweight](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getlistenerweight)

---


## .set_listener_weight(listener, weight, error) :id=set_listener_weight

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `listener` | `int` |  |
  | `weight` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setlistenerweight](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setlistenerweight)

---


## .load_bank_file(filename, flags, out_bank, error) :id=load_bank_file

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `filename` | `string` |  |
  | `flags` | `int` | A bitmask of FMOD_STUDIO_LOAD_BANK_xx values. |
  | `out_bank = undefined` | `FmodBank?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankfile](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankfile)

---


## .load_bank_memory(bank_buffer, buffer_length, mode, flags, out_bank, error) :id=load_bank_memory

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `bank_buffer` | `buffer` |  |
  | `buffer_length` | `int` |  |
  | `mode` | `FMOD_STUDIO_LOAD_MEMORY_MODE` |  |
  | `flags` | `int` | A bitmask of FMOD_STUDIO_LOAD_BANK_xx values. |
  | `out_bank = undefined` | `FmodBank?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankmemory](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankmemory)

---


## ._load_bank_custom() :id=_load_bank_custom

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankcustom](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadbankcustom)

---


## .unload_all(error) :id=unload_all

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_unloadall](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_unloadall)

---


## .get_buffer_usage(out_usage, error) :id=get_buffer_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_usage = undefined` | `FMOD_STUDIO_BUFFER_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_BUFFER_USAGE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbufferusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbufferusage)

---


## .reset_buffer_usage(error) :id=reset_buffer_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_resetbufferusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_resetbufferusage)

---


## ._register_plugin() :id=_register_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_registerplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_registerplugin)

---


## .unregister_plugin(name, error) :id=unregister_plugin

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_unregisterplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_unregisterplugin)

---


## .get_bank_count(error) :id=get_bank_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbankcount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbankcount)

---


## .get_bank_list(error) :id=get_bank_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodBank[]`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbanklist](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getbanklist)

---


## .get_parameter_description_count(error) :id=get_parameter_description_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptioncount](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptioncount)

---


## .get_parameter_description_list(error) :id=get_parameter_description_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION[]`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionlist](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getparameterdescriptionlist)

---


## .start_command_capture(filename, flags, error) :id=start_command_capture

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `filename` | `string` |  |
  | `flags` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_startcommandcapture](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_startcommandcapture)

---


## .stop_command_capture(error) :id=stop_command_capture

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_stopcommandcapture](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_stopcommandcapture)

---


## .load_command_replay(error, flags, out_command_replay, error) :id=load_command_replay

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `string` |  |
  | `flags` | `int` |  |
  | `out_command_replay = undefined` | `FmodCommandReplay?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodCommandReplay`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadcommandreplay](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_loadcommandreplay)

---


## .set_callback(callback, callback_mask, error) :id=set_callback

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `callback` | `function&lt;int, int, int?, void&gt;` |  |
  | `callback_mask = FMOD_STUDIO_SYSTEM_CALLBACK_ALL` | `int` | A bitmask of FMOD_STUDIO_SYSTEM_CALLBACK_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setcallback](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setcallback)

---


## ._get_user_data() :id=_get_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getuserdata)

---


## ._set_user_data() :id=_set_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_setuserdata)

---


## .get_cpu_usage(out_studio_usage, out_core_usage, error) :id=get_cpu_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_studio_usage = undefined` | `FMOD_STUDIO_CPU_USAGE?` |  |
  | `out_core_usage = undefined` | `FMOD_CPU_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getcpuusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getcpuusage)

---


## .get_memory_usage(out_usage, error) :id=get_memory_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_usage = undefined` | `FMOD_STUDIO_MEMORY_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_MEMORY_USAGE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getmemoryusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_getmemoryusage)

---


`FmodStudioSystem FmodStudioSystem_Create(int? header_version, FmodStudioSystem? out_studio_system, FmlError? error)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `header_version = FMOD_VERSION` | `int?` |  |
  | `out_studio_system = undefined` | `FmodStudioSystem?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodStudioSystem`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_create](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-system.html#studio_system_create)
