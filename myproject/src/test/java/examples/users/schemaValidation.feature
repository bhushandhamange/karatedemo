Feature: Schema Validation

Background: Set url

    * url "https://reqres.in/"

@schemaValidation
Scenario: Schema validation for single user 
    Given path "api/users/2"
    When method get
    Then status 200
    Then match response == '#object'
    * def jsonSchemaExpected = 
    """
        {
            "data": {
                "id": '#number',
                "email": "#string",
                "first_name": "#string",
                "last_name": "#string",
                "avatar": "#string"
            },
            "support": {
                "url": "#string",
                "text": "#string"
            }
        }
    """
    * match response == jsonSchemaExpected