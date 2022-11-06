
`FmodSystem() constructor`

**Parameters:**

> (none)

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html)

---


## .release(error) :id=release

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_release](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_release)

---


## .set_output(output, error) :id=set_output

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `output` | `FMOD_OUTPUTTYPE` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setoutput](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setoutput)

---


## .get_output(error) :id=get_output

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `FMOD_OUTPUTTYPE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutput](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutput)

---


## .get_num_drivers(error) :id=get_num_drivers

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumdrivers](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumdrivers)

---


## .get_driver_info(id, out_driver_info, error) :id=get_driver_info

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `id` | `int` |  |
  | `out_driver_info = undefined` | `FML_DRIVER_INFO?` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `FML_DRIVER_INFO`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdriverinfo](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdriverinfo)

---


## .set_driver(driver, error) :id=set_driver

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `driver` | `int` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setdriver](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setdriver)

---


## .get_driver(error) :id=get_driver

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdriver](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdriver)

---


## .set_software_channels(num_software_channels, error) :id=set_software_channels

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `num_software_channels` | `int` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setsoftwarechannels](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setsoftwarechannels)

---


## .get_software_channels(error) :id=get_software_channels

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getsoftwarechannels](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getsoftwarechannels)

---


## .set_software_format(sample_rate, speaker_mode, num_raw_speakers, error) :id=set_software_format

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `sample_rate` | `int` |  |
  | `speaker_mode` | `FMOD_SPEAKERMODE` |  |
  | `num_raw_speakers` | `int` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setsoftwareformat](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setsoftwareformat)

---


## .get_software_format(out_software_format, error) :id=get_software_format

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_software_format` | `FML_SOFTWARE_FORMAT?` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `FML_SOFTWARE_FORMAT`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getsoftwareformat](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getsoftwareformat)

---


## .set_dsp_buffer_size(buffer_length, num_buffers, error) :id=set_dsp_buffer_size

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `buffer_length` | `number` |  |
  | `num_buffers` | `number` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setdspbuffersize](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setdspbuffersize)

---


## .get_dsp_buffer_size(out_dsp_buffer_size, error) :id=get_dsp_buffer_size

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_dsp_buffer_size = undefined` | `FML_DSP_BUFFER_SIZE?` |  |
  | `error = undefined` | `FmlError` |  |

**Returns:** `FML_DSP_BUFFER_SIZE`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspbuffersize](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspbuffersize)

---


## ._set_file_system() :id=_set_file_system

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setfilesystem](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setfilesystem)

---


## ._attach_file_system() :id=_attach_file_system

**Parameters:**

> (none)

**Returns:** `void`



---


## ._set_advanced_settings() :id=_set_advanced_settings

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setadvancedsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setadvancedsettings)

---


## ._get_advanced_settings() :id=_get_advanced_settings

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getadvancedsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getadvancedsettings)

---


## .set_callback(callback, callback_mask, error) :id=set_callback

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `callback` | `function&lt;int, int, void&gt;` |  |
  | `callback_mask = FMOD_SYSTEM_CALLBACK_ALL` | `int` | A bitmask of FMOD_SYSTEM_CALLBACK_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setcallback](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setcallback)

---


## ._set_plugin_path() :id=_set_plugin_path

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setpluginpath](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setpluginpath)

---


## ._load_plugin() :id=_load_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_loadplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_loadplugin)

---


## ._unload_plugin() :id=_unload_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_unloadplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_unloadplugin)

---


## ._get_num_nested_plugins() :id=_get_num_nested_plugins

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumnestedplugins](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumnestedplugins)

---


## ._get_nested_plugin() :id=_get_nested_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnestedplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnestedplugin)

---


## ._get_num_plugins() :id=_get_num_plugins

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumplugins](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnumplugins)

---


## ._get_plugin_handle() :id=_get_plugin_handle

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getpluginhandle](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getpluginhandle)

---


## ._get_plugin_info() :id=_get_plugin_info

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getplugininfo](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getplugininfo)

---


## ._set_output_by_plugin() :id=_set_output_by_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setoutputbyplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setoutputbyplugin)

---


## ._get_output_by_plugin() :id=_get_output_by_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutputbyplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutputbyplugin)

---


## ._create_dsp_by_plugin() :id=_create_dsp_by_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdspbyplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdspbyplugin)

---


## ._get_dsp_info_by_plugin() :id=_get_dsp_info_by_plugin

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspinfobyplugin](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspinfobyplugin)

---


## ._register_codec() :id=_register_codec

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registercodec](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registercodec)

---


## ._register_dsp() :id=_register_dsp

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registerdsp](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registerdsp)

---


## ._register_output() :id=_register_output

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registeroutput](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_registeroutput)

---


## .init(max_channels, flags, error) :id=init

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `max_channels` | `int` |  |
  | `flags` | `int` | A bitmask of FMOD_INIT_xx values. |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_init](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_init)

---


## .close(error) :id=close

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_close](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_close)

---


## .update(error) :id=update

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_update](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_update)

---


## ._set_speaker_position() :id=_set_speaker_position

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setspeakerposition](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setspeakerposition)

---


## ._get_speaker_position() :id=_get_speaker_position

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getspeakerposition](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getspeakerposition)

---


## ._set_stream_buffer_size() :id=_set_stream_buffer_size

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setstreambuffersize](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setstreambuffersize)

---


## ._get_stream_buffer_size() :id=_get_stream_buffer_size

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getstreambuffersize](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getstreambuffersize)

---


## .set_3d_settings(doppler_scale, distance_factor, rolloff_scale, error) :id=set_3d_settings

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `doppler_scale` | `number` |  |
  | `distance_factor` | `number` |  |
  | `rolloff_scale` | `number` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `bool`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dsettings)

---


## .get_3d_settings(out_settings, error) :id=get_3d_settings

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `out_settings = undefined` | `FML_3D_SETTINGS?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FML_3D_SETTINGS`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dsettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dsettings)

---


## ._set_3d_num_listeners() :id=_set_3d_num_listeners

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dnumlisteners](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dnumlisteners)

---


## ._get_3d_num_listeners() :id=_get_3d_num_listeners

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dnumlisteners](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dnumlisteners)

---


## ._set_3d_listener_attributes() :id=_set_3d_listener_attributes

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dlistenerattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3dlistenerattributes)

---


## ._get_3d_listener_attributes() :id=_get_3d_listener_attributes

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dlistenerattributes](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_get3dlistenerattributes)

---


## ._set_3d_rolloff_callback() :id=_set_3d_rolloff_callback

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3drolloffcallback](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_set3drolloffcallback)

---


## ._mixer_suspend() :id=_mixer_suspend

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_mixersuspend](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_mixersuspend)

---


## ._mixer_resume() :id=_mixer_resume

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_mixerresume](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_mixerresume)

---


## ._get_default_mix_matrix() :id=_get_default_mix_matrix

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdefaultmixmatrix](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdefaultmixmatrix)

---


## ._get_speaker_mode_channels() :id=_get_speaker_mode_channels

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getspeakermodechannels](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getspeakermodechannels)

---


## .get_version(error) :id=get_version

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `error = undefined` | `FmlError` |  |

**Returns:** `int`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getversion](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getversion)

---


## ._get_output_handle() :id=_get_output_handle

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutputhandle](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getoutputhandle)

---


## ._get_channels_playing() :id=_get_channels_playing

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getchannelsplaying](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getchannelsplaying)

---


## ._get_cpu_usage() :id=_get_cpu_usage

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getcpuusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getcpuusage)

---


## ._get_file_usage() :id=_get_file_usage

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getfileusage](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getfileusage)

---


## ._create_sound() :id=_create_sound

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createsound](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createsound)

---


## ._create_stream() :id=_create_stream

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createstream](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createstream)

---


## ._create_dsp() :id=_create_dsp

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdsp](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdsp)

---


## ._create_dsp_by_type() :id=_create_dsp_by_type

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdspbytype](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createdspbytype)

---


## ._create_channel_group() :id=_create_channel_group

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createchannelgroup](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createchannelgroup)

---


## ._create_sound_group() :id=_create_sound_group

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createsoundgroup](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createsoundgroup)

---


## ._create_reverb_3d() :id=_create_reverb_3d

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createreverb3d](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_createreverb3d)

---


## ._play_sound() :id=_play_sound

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_playsound](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_playsound)

---


## ._play_dsp() :id=_play_dsp

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_playdsp](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_playdsp)

---


## ._get_channel() :id=_get_channel

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getchannel](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getchannel)

---


## ._get_dsp_info_by_type() :id=_get_dsp_info_by_type

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspinfobytype](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getdspinfobytype)

---


## ._get_master_channel_group() :id=_get_master_channel_group

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getmasterchannelgroup](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getmasterchannelgroup)

---


## ._get_master_sound_group() :id=_get_master_sound_group

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getmastersoundgroup](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getmastersoundgroup)

---


## ._attach_channel_group_to_port() :id=_attach_channel_group_to_port

**Parameters:**

> (none)

**Returns:** `void`



---


## ._detach_channel_group_from_port() :id=_detach_channel_group_from_port

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_detachchannelgroupfromport](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_detachchannelgroupfromport)

---


## ._set_reverb_properties() :id=_set_reverb_properties

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setreverbproperties](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setreverbproperties)

---


## ._get_reverb_properties() :id=_get_reverb_properties

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getreverbproperties](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getreverbproperties)

---


## ._lock_dsp() :id=_lock_dsp

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_lockdsp](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_lockdsp)

---


## ._unlock_dsp() :id=_unlock_dsp

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_unlockdsp](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_unlockdsp)

---


## ._get_record_num_drivers() :id=_get_record_num_drivers

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecordnumdrivers](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecordnumdrivers)

---


## ._get_record_driver_info() :id=_get_record_driver_info

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecorddriverinfo](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecorddriverinfo)

---


## ._get_record_position() :id=_get_record_position

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecordposition](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getrecordposition)

---


## ._record_start() :id=_record_start

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_recordstart](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_recordstart)

---


## ._record_stop() :id=_record_stop

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_recordstop](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_recordstop)

---


## ._is_recording() :id=_is_recording

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_isrecording](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_isrecording)

---


## ._create_geometry() :id=_create_geometry

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_creategeometry](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_creategeometry)

---


## ._set_geometry_settings() :id=_set_geometry_settings

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setgeometrysettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setgeometrysettings)

---


## ._get_geometry_settings() :id=_get_geometry_settings

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getgeometrysettings](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getgeometrysettings)

---


## ._load_geometry() :id=_load_geometry

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_loadgeometry](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_loadgeometry)

---


## ._get_geometry_occlusion() :id=_get_geometry_occlusion

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getgeometryocclusion](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getgeometryocclusion)

---


## ._set_network_proxy() :id=_set_network_proxy

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setnetworkproxy](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setnetworkproxy)

---


## ._get_network_proxy() :id=_get_network_proxy

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnetworkproxy](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnetworkproxy)

---


## ._set_network_timeout() :id=_set_network_timeout

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setnetworktimeout](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setnetworktimeout)

---


## ._get_network_timeout() :id=_get_network_timeout

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnetworktimeout](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getnetworktimeout)

---


## ._set_user_data() :id=_set_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_setuserdata)

---


## ._get_user_data() :id=_get_user_data

**Parameters:**

> (none)

**Returns:** `void`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getuserdata](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_getuserdata)

---


`FmodSystem FmodSystem_Create(int? header_version, FmodSystem? out_system, FmlError? error)`

**Parameters:**

> | Name | Type | Description |
  |:-|:-|:-|
  | `header_version = FMOD_VERSION` | `int?` |  |
  | `out_system = undefined` | `FmodSystem?` |  |
  | `error = undefined` | `FmlError?` |  |

**Returns:** `FmodSystem`

FMOD API documentation: [https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_create](https://www.fmod.com/resources/documentation-api?version&#x3D;2.02&amp;page&#x3D;core-api-system.html#system_create)
