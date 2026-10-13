{% api_method suicide '' A %}

Kill the power creep immediately. It will not be destroyed permanently, but will become unspawned,
so that you can [`spawn`](#PowerCreep.spawn) it again.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
{% endapi_return_codes %}
