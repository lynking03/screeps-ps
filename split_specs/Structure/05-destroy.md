{% api_method destroy '' A %}

Destroy this structure immediately.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure, and it's not in your room.
ERR_BUSY | Hostile creeps are in the room.
{% endapi_return_codes %}
