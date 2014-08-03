JPath
=====

Easier accessing of JSON values in Swift.

### Purpose ###
Its a pain to read JSON with Swift
Similar to XPath

### Example ###

``` json
{
  "object": {
    "int": 1,
    "boolean": true
  },
  "string": "a string value"
}
```

To access the value for `string` the JPath would be `string`.<br />
To access the value for `boolean` the JPath would be `object/boolean`.
