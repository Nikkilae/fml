
`FmodEventInstance() constructor`

**Parameters:**

(none)

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html)

---


### `.is_valid(error) :id=is_valid`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvalid](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvalid)

<br/><br/>

---


### `.get_description(out_description, error) :id=get_description`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_description = undefined` | `FmodEventDescription?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventDescription`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getdescription](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getdescription)

<br/><br/>

---


### `.get_volume(out_struct, error) :id=get_volume`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getvolume](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getvolume)

<br/><br/>

---


### `.set_volume(volume, error) :id=set_volume`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `volume` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setvolume](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setvolume)

<br/><br/>

---


### `.get_pitch(out_struct, error) :id=get_pitch`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpitch](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpitch)

<br/><br/>

---


### `.set_pitch(pitch, error) :id=set_pitch`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `pitch` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpitch](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpitch)

<br/><br/>

---


### `.get_3d_attributes(out_attributes, error) :id=get_3d_attributes`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_attributes = undefined` | `FMOD_3D_ATTRIBUTES?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_3D_ATTRIBUTES`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_get3dattributes](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_get3dattributes)

<br/><br/>

---


### `.set_3d_attributes(attributes, error) :id=set_3d_attributes`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `attributes` | `FMOD_3D_ATTRIBUTES` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_set3dattributes](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_set3dattributes)

<br/><br/>

---


### `.get_listener_mask(error) :id=get_listener_mask`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getlistenermask](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getlistenermask)

<br/><br/>

---


### `.set_listener_mask(mask, error) :id=set_listener_mask`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `mask` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setlistenermask](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setlistenermask)

<br/><br/>

---


### `.get_property(property, error) :id=get_property`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `property` | `FMOD_STUDIO_EVENT_PROPERTY` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getproperty](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getproperty)

<br/><br/>

---


### `.set_property(property, value, error) :id=set_property`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `property` | `FMOD_STUDIO_EVENT_PROPERTY` |  |
  | `value` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setproperty](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setproperty)

<br/><br/>

---


### `.get_reverb_level(index, error) :id=get_reverb_level`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getreverblevel](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getreverblevel)

<br/><br/>

---


### `.set_reverb_level(index, level, error) :id=set_reverb_level`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `level` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setreverblevel](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setreverblevel)

<br/><br/>

---


### `.get_paused(error) :id=get_paused`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpaused](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpaused)

<br/><br/>

---


### `.set_paused(paused, error) :id=set_paused`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `paused` | `bool` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpaused](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpaused)

<br/><br/>

---


### `.start(error) :id=start`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_start](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_start)

<br/><br/>

---


### `.stop(mode, error) :id=stop`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `mode` | `FMOD_STUDIO_STOP_MODE` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_stop](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_stop)

<br/><br/>

---


### `.get_timeline_position(error) :id=get_timeline_position`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_gettimelineposition](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_gettimelineposition)

<br/><br/>

---


### `.set_timeline_position(position, error) :id=set_timeline_position`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `position` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_settimelineposition](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_settimelineposition)

<br/><br/>

---


### `.get_playback_state(error) :id=get_playback_state`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PLAYBACK_STATE`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getplaybackstate](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getplaybackstate)

<br/><br/>

---


### `.get_channel_group(out_channel_group, error) :id=get_channel_group`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_channel_group = undefined` | `FmodChannelGroup?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodChannelGroup`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getchannelgroup](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getchannelgroup)

<br/><br/>

---


### `.get_min_max_distance(out_struct, error) :id=get_min_max_distance`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getminmaxdistance](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getminmaxdistance)

<br/><br/>

---


### `.release(error) :id=release`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_release](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_release)

<br/><br/>

---


### `.is_virtual(error) :id=is_virtual`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvirtual](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvirtual)

<br/><br/>

---


### `.get_parameter_by_id(parameter_id, out_struct, error) :id=get_parameter_by_id`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyid](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyid)

<br/><br/>

---


### `.set_parameter_by_id(parameter_id, value, ignore_seek_speed, error) :id=set_parameter_by_id`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `value` | `number` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyid](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyid)

<br/><br/>

---


### `.set_parameter_by_id_with_label(parameter_id, label, ignore_seek_speed, error) :id=set_parameter_by_id_with_label`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `parameter_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `label` | `string` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyidwithlabel](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyidwithlabel)

<br/><br/>

---


### `.set_parameters_by_ids(parameter_ids, values, ignore_seek_speed, error) :id=set_parameters_by_ids`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `parameter_ids` | `FMOD_STUDIO_PARAMETER_ID[]` |  |
  | `values` | `number[]` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparametersbyids](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparametersbyids)

<br/><br/>

---


### `.get_parameter_by_name(name, out_struct, error) :id=get_parameter_by_name`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyname](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyname)

<br/><br/>

---


### `.set_parameter_by_name(name, value, ignore_seek_speed, error) :id=set_parameter_by_name`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `value` | `number` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyname](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyname)

<br/><br/>

---


### `.set_parameter_by_name_with_label(name, label, ignore_seek_speed, error) :id=set_parameter_by_name_with_label`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `label` | `string` |  |
  | `ignore_seek_speed = false` | `bool?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbynamewithlabel](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbynamewithlabel)

<br/><br/>

---


### `.key_off(error) :id=key_off`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_keyoff](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_keyoff)

<br/><br/>

---


### `.get_cpu_usage(out_struct, error) :id=get_cpu_usage`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getcpuusage](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getcpuusage)

<br/><br/>

---


### `.get_memory_usage(out_usage, error) :id=get_memory_usage`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `out_usage = undefined` | `FMOD_STUDIO_MEMORY_USAGE?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_MEMORY_USAGE`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getmemoryusage](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getmemoryusage)

<br/><br/>

---


### `.set_callback(callback, callback_mask, error) :id=set_callback`

**Parameters:**

| Name | Type | Description |
  |:-|:-|:-|
  | `callback` | `function<int, int, any, void>` |  |
  | `callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL` | `int` | A bitmask of FMOD_STUDIO_EVENT_CALLBACK_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setcallback](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setcallback)

<br/><br/>

---


### `._get_user_data() :id=_get_user_data`

**Parameters:**

(none)

**Returns:** `void`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getuserdata](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getuserdata)

<br/><br/>

---


### `._set_user_data() :id=_set_user_data`

**Parameters:**

(none)

**Returns:** `void`

FMOD API documentation:<br/>[https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setuserdata](https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setuserdata)

<br/><br/>

---

