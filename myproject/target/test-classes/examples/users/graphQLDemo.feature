@graphql
Feature: GraphQL Demo

Background: 
    * url 'https://swapi-graphql.netlify.app/.netlify/functions/index'

Scenario: GraphQL demo
    Given path "/"
    Given text query =
    """
        {
            allFilms {
              films {
                title
              }
            }
          }
    """
    And request {query : '#(query)'}
    When method post
    Then status 200
    Then match response == "#object"
    Then match response.data.allFilms.films[0].title == "A New Hope"