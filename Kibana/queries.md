
### Dashboard example - Person per country

![image info](./images/dash_example_1.png)


### Insert data

```
POST /clientes/_doc
{
  "name": "Pedro",
  "nickname": "Pedrinho",
  "country": "Brazil",
  "locale": "Jundiaí"
}
```

### Find data
```
GET /clientes/_search
{
  "query": {
    "match": {
      "country": "Brazil"
    }
  }
}
```

### Dashboard example - filter by nickname

![image info](./images/dash_filter_example.png)