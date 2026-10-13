{% api_method Game.cpu.generatePixel '' 3 %}

```javascript
if(Game.cpu.bucket == 10000) {
    Game.cpu.generatePixel();
}
```

Generate 1 pixel resource unit for 10000 CPU from your bucket.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_ENOUGH_RESOURCES | Your bucket does not have enough CPU.
{% endapi_return_codes %}
