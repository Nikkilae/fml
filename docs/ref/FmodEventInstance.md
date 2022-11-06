
`FmodEventInstance() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html)

---


## .is_valid(error) :id=is_valid

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_isvalid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_isvalid)

---


## .get_description(out_description, error) :id=get_description

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_description = undefined` | `FmodEventDescription?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventDescription`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getdescription](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getdescription)

---


## .get_volume(out_struct, error) :id=get_volume

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getvolume](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getvolume)

---


## .set_volume(volume, error) :id=set_volume

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `volume` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setvolume](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setvolume)

---


## .get_pitch(out_struct, error) :id=get_pitch

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getpitch](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getpitch)

---


## .set_pitch(pitch, error) :id=set_pitch

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `pitch` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setpitch](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setpitch)

---


## .get_3d_attributes(out_attributes, error) :id=get_3d_attributes

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_attributes = undefined` | `FMOD_3D_ATTRIBUTES?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_3D_ATTRIBUTES`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_get3dattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_get3dattributes)

---


## .set_3d_attributes(attributes, error) :id=set_3d_attributes

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `attributes` | `FMOD_3D_ATTRIBUTES` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_set3dattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_set3dattributes)

---


## .get_listener_mask(error) :id=get_listener_mask

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getlistenermask](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getlistenermask)

---


## .set_listener_mask(mask, error) :id=set_listener_mask

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `mask` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setlistenermask](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setlistenermask)

---


## .get_property(property, error) :id=get_property

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `property` | `FMOD_STUDIO_EVENT_PROPERTY` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getproperty](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getproperty)

---


## .set_property(property, value, error) :id=set_property

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `property` | `FMOD_STUDIO_EVENT_PROPERTY` |  |
  | `value` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setproperty](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setproperty)

---


## .get_reverb_level(index, error) :id=get_reverb_level

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getreverblevel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getreverblevel)

---


## .set_reverb_level(index, level, error) :id=set_reverb_level

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `level` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setreverblevel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setreverblevel)

---


## .get_paused(error) :id=get_paused

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getpaused](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getpaused)

---


## .set_paused(paused, error) :id=set_paused

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `paused` | `bool` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setpaused](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setpaused)

---


## .start(error) :id=start

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_start](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_start)

---


## .stop(mode, error) :id=stop

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `mode` | `FMOD_STUDIO_STOP_MODE` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_stop](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_stop)

---


## .get_timeline_position(error) :id=get_timeline_position

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_gettimelineposition](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_gettimelineposition)

---


## .set_timeline_position(position, error) :id=set_timeline_position

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `position` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_settimelineposition](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_settimelineposition)

---


## .get_playback_state(error) :id=get_playback_state

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PLAYBACK_STATE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getplaybackstate](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getplaybackstate)

---


## .get_channel_group(out_channel_group, error) :id=get_channel_group

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_channel_group = undefined` | `FmodChannelGroup?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodChannelGroup`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getchannelgroup](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getchannelgroup)

---


## .get_min_max_distance(out_struct, error) :id=get_min_max_distance

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getminmaxdistance](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getminmaxdistance)

---


## .release(error) :id=release

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_release](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_release)

---


## .is_virtual(error) :id=is_virtual

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_isvirtual](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_isvirtual)

---


## .get_parameter_by_id(parameter_id, out_struct, error) :id=get_parameter_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getparameterbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getparameterbyid)

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

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyid](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyid)

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

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyidwithlabel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyidwithlabel)

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

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparametersbyids](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparametersbyids)

---


## .get_parameter_by_name(name, out_struct, error) :id=get_parameter_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getparameterbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getparameterbyname)

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

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyname](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbyname)

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

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbynamewithlabel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setparameterbynamewithlabel)

---


## .key_off(error) :id=key_off

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_keyoff](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_keyoff)

---


## .get_cpu_usage(out_struct, error) :id=get_cpu_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getcpuusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getcpuusage)

---


## .get_memory_usage(out_usage, error) :id=get_memory_usage

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_usage = undefined` | `FMOD_STUDIO_MEMORY_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_MEMORY_USAGE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getmemoryusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getmemoryusage)

---


## .set_callback(callback, callback_mask, error) :id=set_callback

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `callback` | `function&lt;int, int, any, void&gt;` |  |
  | `callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL` | `int` | A bitmask of FMOD_STUDIO_EVENT_CALLBACK_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setcallback](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setcallback)

---


## ._get_user_data() :id=_get_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_getuserdata)

---


## ._set_user_data() :id=_set_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;studio-api-eventinstance.html#studio_eventinstance_setuserdata)

---

