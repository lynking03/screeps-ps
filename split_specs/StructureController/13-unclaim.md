{% api_method unclaim '' A %}

```javascript
room.controller.unclaim();
```

Make your claimed controller neutral again.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this controller.
{% endapi_return_codes %}
