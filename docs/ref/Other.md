
<!-- Autogenerated file, don't touch. -->
# Other

<br/><pre>

function <a href="/#/ref/Other?id=fml_fmod_version_from_parts">fml_fmod_version_from_parts</a>(product: int, major: int, minor: int) -> int
function <a href="/#/ref/Other?id=fml_fmod_version_get_product">fml_fmod_version_get_product</a>(version_number: int) -> int
function <a href="/#/ref/Other?id=fml_fmod_version_get_major">fml_fmod_version_get_major</a>(version_number: int) -> int
function <a href="/#/ref/Other?id=fml_fmod_version_get_minor">fml_fmod_version_get_minor</a>(version_number: int) -> int
function <a href="/#/ref/Other?id=fml_fmod_version_to_string">fml_fmod_version_to_string</a>(version_number: int) -> string
function <a href="/#/ref/Other?id=fml_update_callbacks">fml_update_callbacks</a>() -> void


</pre>

---


---

<div class="fmod-docs-link-wrapper">

### `fml_fmod_version_from_parts(product, major, minor) :id=fml_fmod_version_from_parts`

</div>

| Parameter | Type | Description |
|:-|:-|:-|
| <pre>product</pre> | <pre>int</pre> |  |
| <pre>major</pre> | <pre>int</pre> |  |
| <pre>minor</pre> | <pre>int</pre> |  |

<pre>Returns: int</pre>

<p></p>

<br/>
<div class="fmod-docs-link-wrapper">

### `fml_fmod_version_get_product(version_number) :id=fml_fmod_version_get_product`

</div>

| Parameter | Type | Description |
|:-|:-|:-|
| <pre>version_number</pre> | <pre>int</pre> |  |

<pre>Returns: int</pre>

<p></p>

<br/>
<div class="fmod-docs-link-wrapper">

### `fml_fmod_version_get_major(version_number) :id=fml_fmod_version_get_major`

</div>

| Parameter | Type | Description |
|:-|:-|:-|
| <pre>version_number</pre> | <pre>int</pre> |  |

<pre>Returns: int</pre>

<p></p>

<br/>
<div class="fmod-docs-link-wrapper">

### `fml_fmod_version_get_minor(version_number) :id=fml_fmod_version_get_minor`

</div>

| Parameter | Type | Description |
|:-|:-|:-|
| <pre>version_number</pre> | <pre>int</pre> |  |

<pre>Returns: int</pre>

<p></p>

<br/>
<div class="fmod-docs-link-wrapper">

### `fml_fmod_version_to_string(version_number) :id=fml_fmod_version_to_string`

</div>

| Parameter | Type | Description |
|:-|:-|:-|
| <pre>version_number</pre> | <pre>int</pre> |  |

<pre>Returns: string</pre>

<p></p>

<br/>
<div class="fmod-docs-link-wrapper">

### `fml_update_callbacks() :id=fml_update_callbacks`

</div>


<pre>Returns: void</pre>

<p>Processes all pending FMOD callbacks, calling them and clearing the queue.</p>

<br/>