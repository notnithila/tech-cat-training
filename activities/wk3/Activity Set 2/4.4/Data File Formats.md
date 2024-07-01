# JSON

**BASIC JSON**

```JSON
[
    {
        "claimId": 1,
        "policyHolder": "John Doe",
        "date": "2023-01-15",
        "amount": "$5,000",
        "type": "Auto"
    },
    {
        "claimId": 2,
        "policyHolder": "Jane Smith",
        "date": "2023-02-28",
        "amount": "$10,000",
        "type": "Home"
    },
       {
        "claimId": 3,
        "policyHolder": "Sara Smith",
        "date": "2023-02-28",
        "amount": "$19,000",
        "type": "Auto"
    },
]
```

**COMPLEX JSON WITH NESTED DATA**

```JSON
{
    "claims": [
        {
            "claimId": 1,
            "policy": {
                "policyNumber": "A12345",
                "policyHolder": {
                    "firstName": "John",
                    "lastName": "Doe",
                    "address": {
                        "street": "123 Main St",
                        "city": "Anytown",
                        "state": "CA",
                        "zip": "12345"
                    }
                },
                "coverageType": "Auto",
                "coverageAmount": "$100,000"
            },
            "incident": {
                "date": "2023-01-15",
                "description": "Car accident at Main St.",
                "damages": [
                    {
                        "item": "Car bumper",
                        "cost": "$2,000"
                    },
                    {
                        "item": "Front windshield",
                        "cost": "$3,000"
                    }
                ]
            },
            "claimAmount": "$5,000"
        },
        {
            "claimId": 2,
            "policy": {
                "policyNumber": "B67890",
                "policyHolder": {
                    "firstName": "Jane",
                    "lastName": "Smith",
                    "address": {
                        "street": "456 Elm St",
                        "city": "Othertown",
                        "state": "NY",
                        "zip": "67890"
                    }
                },
                "coverageType": "Home",
                "coverageAmount": "$200,000"
            },
            "incident": {
                "date": "2023-02-28",
                "description": "Fire damage in the living room.",
                "damages": [
                    {
                        "item": "Sofa",
                        "cost": "$1,500"
                    },
                    {
                        "item": "TV",
                        "cost": "$500"
                    },
                    {
                        "item": "Carpet",
                        "cost": "$8,000"
                    }
                ]
            },
            "claimAmount": "$10,000"
        },
        ...
    ]
}

```

----

# XML

**BASIC XML**

```xml
<claims>
    <claim>
        <claimId>1</claimId>
        <policyHolder>John Doe</policyHolder>
        <date>2023-01-15</date>
        <amount>$5,000</amount>
        <type>Auto</type>
    </claim>
    <claim>
        <claimId>2</claimId>
        <policyHolder>Jane Smith</policyHolder>
        <date>2023-02-28</date>
        <amount>$10,000</amount>
        <type>Home</type>
    </claim>
</claims>

```

**Complex XML with nested data**

```xml
<claims>
    <claim>
        <claimId>1</claimId>
        <policy>
            <policyNumber>A12345</policyNumber>
            <policyHolder>
                <firstName>John</firstName>
                <lastName>Doe</lastName>
                <address>
                    <street>123 Main St</street>
                    <city>Anytown</city>
                    <state>CA</state>
                    <zip>12345</zip>
                </address>
            </policyHolder>
            <coverageType>Auto</coverageType>
            <coverageAmount>$100,000</coverageAmount>
        </policy>
        <incident>
            <date>2023-01-15</date>
            <description>Car accident at Main St.</description>
            <damages>
                <damage>
                    <item>Car bumper</item>
                    <cost>$2,000</cost>
                </damage>
                <damage>
                    <item>Front windshield</item>
                    <cost>$3,000</cost>
                </damage>
            </damages>
        </incident>
        <claimAmount>$5,000</claimAmount>
    </claim>
    <claim>
        <claimId>2</claimId>
        <policy>
            <policyNumber>B67890</policyNumber>
            <policyHolder>
                <firstName>Jane</firstName>
                <lastName>Smith</lastName>
                <address>
                    <street>456 Elm St</street>
                    <city>Othertown</city>
                    <state>NY</state>
                    <zip>67890</zip>
                </address>
            </policyHolder>
            <coverageType>Home</coverageType>
            <coverageAmount>$200,000</coverageAmount>
        </policy>
        <incident>
            <date>2023-02-28</date>
            <description>Fire damage in the living room.</description>
            <damages>
                <damage>
                    <item>Sofa</item>
                    <cost>$1,500</cost>
                </damage>
                <damage>
                    <item>TV</item>
                    <cost>$500</cost>
                </damage>
                <damage>
                    <item>Carpet</item>
                    <cost>$8,000</cost>
                </damage>
            </damages>
        </incident>
        <claimAmount>$10,000</claimAmount>
    </claim>
</claims>

```

----

# Comma Delimited (CSV)

```
claimId,policyHolder,date,amount,type
1,John Doe,2023-01-15,"$5,000",Auto
2,Jane Smith,2023-02-28,"$10,000",Home
...

```



# PIP Delimited | 

```
claimId|policyHolder|date|amount|type
1|John Doe|2023-01-15|$5,000|Auto
2|Jane Smith|2023-02-28|$10,000|Home
...

```

