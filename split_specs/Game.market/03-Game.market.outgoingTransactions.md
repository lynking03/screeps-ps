{% api_property Game.market.outgoingTransactions 'array' %}

```javascript
[{
    transactionId : "56dec546a180ce641dd65960",
    time : 10390687,
    sender : {username: "Me"},
    recipient : {username: "Recipient"},
    resourceType : "U",
    amount : 100,
    from : "W0N0",
    to : "W10N10",
    description : "trade contract #1",
	order: {		// optional
		id : "55c34a6b5be41a0a6e80c68b",
		type : "sell",
		price : 2.95
	}
}]
```

An array of the last 100 outgoing transactions from your terminals with the following format:
