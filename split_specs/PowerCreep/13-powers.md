{% api_property powers object %}
Available powers, an object with power ID as a key, and the following properties:

{% api_method_params %}
level : number
Current level of the power.
===
cooldown : number
Cooldown ticks remaining, or undefined if the power creep is not spawned in the world.
{% endapi_method_params %}
