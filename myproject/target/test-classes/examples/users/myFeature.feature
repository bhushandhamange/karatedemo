Feature: Get Users

Background: Set url

    * url "https://reqres.in/"

@getUser
Scenario: Get particular user 
    Given path "api/users/2"
    When method get
    Then status 200

@createUser
Scenario: Create new user
    Given path "api/users" 
    And request
    """
        {
            "name": "morpheus",
            "job": "leader"
        }
    """
    When method post
    Then status 201
    Then match response == "#object"
    Then match response.name == "morpheus"