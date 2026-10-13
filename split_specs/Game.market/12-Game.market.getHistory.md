{% api_method Game.market.getHistory '[resourceType]' 1 %}

Get daily price history of the specified resource on the market for the last 14 days.

{% api_method_params %}
resourceType (optional) : string
One of the `RESOURCE_*` constants. If undefined, returns history data for all resources.
{% endapi_method_params %}

### Return value

Returns an array of objects with the following format:
```json-content
[{
    "resourceType": "L",
    "date": "2019-06-24",
    "transactions": 4,
    "volume": 400,
    "avgPrice": 3.63,
    "stddevPrice": 0.27
}]    
```
