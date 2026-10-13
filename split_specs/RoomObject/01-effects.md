{% api_property effects array %}
Applied effects, an array of objects with the following properties:

{% api_method_params %}
effect : number
Effect ID of the applied effect. Can be either natural effect ID or Power ID.
===
level (optional) : number
Power level of the applied effect. Absent if the effect is not a Power effect.
===
ticksRemaining : number
How many ticks will the effect last.
{% endapi_method_params %}
