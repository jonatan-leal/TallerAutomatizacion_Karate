@appcontact_login
Feature: Login to App Contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: User Login
    Given path '/users/login'
    And request {"email": "jonleal@mail.com", "password": "jonleal"}
    When method POST
    Then status 200
    And match response ==
    """
    {
        "user": {
            "_id": '#string',
            "firstName": '#string',
            "lastName": '#string',
            "email": '#string',
            "__v": '#number'
        },
        "token": '#string'
    }
    """