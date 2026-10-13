{% api_property body array %}

An array describing the creep’s body. Each element contains the following properties:

{% api_method_params %}
boost : string | undefined
If the body part is boosted, this property specifies the mineral type which is used for boosting. One of the RESOURCE_* constants. Learn more
===
type : string
One of the body part types constants.
===
hits : number
The remaining amount of hit points of this body part.
{% endapi_method_params %}
