
`FmodEventDescription() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html)

---


## .is_valid(error) :id=is_valid

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isvalid](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isvalid)

---


## .get_id(out_guid, error) :id=get_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_guid = undefined` | `FMOD_GUID?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_GUID`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getid](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getid)

---


## .get_path(error) :id=get_path

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getpath](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getpath)

---


## .get_parameter_description_count(error) :id=get_parameter_description_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptioncount](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptioncount)

---


## .get_parameter_description_by_index(index, out_description, error) :id=get_parameter_description_by_index

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `out_description = undefined` | `FMOD_STUDIO_PARAMETER_DESCRIPTION?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyindex](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyindex)

---


## .get_parameter_description_by_name(name, out_description, error) :id=get_parameter_description_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_description = undefined` | `FMOD_STUDIO_PARAMETER_DESCRIPTION?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyname](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyname)

---


## .get_parameter_description_by_id(param_id, out_description, error) :id=get_parameter_description_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `param_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `out_description = undefined` | `FMOD_STUDIO_PARAMETER_DESCRIPTION?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_PARAMETER_DESCRIPTION`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyid](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyid)

---


## .get_parameter_label_by_index(index, label_index, error) :id=get_parameter_label_by_index

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `label_index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyindex](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyindex)

---


## .get_parameter_label_by_name(name, label_index, error) :id=get_parameter_label_by_name

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `label_index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyname](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyname)

---


## .get_parameter_label_by_id(param_id, label_index, error) :id=get_parameter_label_by_id

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `param_id` | `FMOD_STUDIO_PARAMETER_ID` |  |
  | `label_index` | `int` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `string`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyid](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyid)

---


## .get_user_property_count(error) :id=get_user_property_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserpropertycount](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserpropertycount)

---


## .get_user_property_by_index(index, out_property, error) :id=get_user_property_by_index

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `index` | `int` |  |
  | `out_property = undefined` | `FMOD_STUDIO_USER_PROPERTY?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_USER_PROPERTY`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserpropertybyindex](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserpropertybyindex)

---


## .get_user_property(name, out_property, error) :id=get_user_property

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `name` | `string` |  |
  | `out_property = undefined` | `FMOD_STUDIO_USER_PROPERTY?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_USER_PROPERTY`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserproperty](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserproperty)

---


## .get_length(error) :id=get_length

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getlength](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getlength)

---


## .get_min_max_distance(out_struct, error) :id=get_min_max_distance

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_struct = undefined` | `struct?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `struct`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getminmaxdistance](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getminmaxdistance)

---


## .get_sound_size(error) :id=get_sound_size

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `number`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getsoundsize](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getsoundsize)

---


## .is_snapshot(error) :id=is_snapshot

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_issnapshot](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_issnapshot)

---


## .is_oneshot(error) :id=is_oneshot

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isoneshot](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isoneshot)

---


## .is_stream(error) :id=is_stream

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isstream](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isstream)

---


## .is_3d(error) :id=is_3d

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_is3d](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_is3d)

---


## .is_doppler_enabled(error) :id=is_doppler_enabled

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isdopplerenabled](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_isdopplerenabled)

---


## .has_sustain_point(error) :id=has_sustain_point

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_hassustainpoint](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_hassustainpoint)

---


## .create_instance(out_event_instance, error) :id=create_instance

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_event_instance = undefined` | `FmodEventInstance?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventInstance`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_createinstance](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_createinstance)

---


## .get_instance_count(error) :id=get_instance_count

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getinstancecount](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getinstancecount)

---


## .get_instance_list(error) :id=get_instance_list

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodEventInstance[]`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getinstancelist](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getinstancelist)

---


## .load_sample_data(error) :id=load_sample_data

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_loadsampledata](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_loadsampledata)

---


## .unload_sample_data(error) :id=unload_sample_data

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_unloadsampledata](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_unloadsampledata)

---


## .get_sample_loading_state(error) :id=get_sample_loading_state

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FMOD_STUDIO_LOADING_STATE`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getsampleloadingstate](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getsampleloadingstate)

---


## .release_all_instances(error) :id=release_all_instances

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_releaseallinstances](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_releaseallinstances)

---


## .set_callback(callback, callback_mask, error) :id=set_callback

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `callback` | `function&lt;int, int, any, void&gt;` |  |
  | `callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL` | `int` | A bitmask of FMOD_STUDIO_EVENT_CALLBACK_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_setcallback](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_setcallback)

---


## ._get_user_data() :id=_get_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserdata](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_getuserdata)

---


## ._set_user_data() :id=_set_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_setuserdata](https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#studio_eventdescription_setuserdata)

---

