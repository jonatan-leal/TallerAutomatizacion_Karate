@appcontact_add_contact
Feature: Add Contact to App Contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def credentials = 
    """
    {
      "email": "jonleal@mail.com",
      "password": "jonleal"
    }
    """
    * def validContact = 
    """
    {
        "firstName": "John",
        "lastName": "Doe",
        "birthdate": "1970-01-01",
        "email": "johndoe@mail.com",
        "phone": "8005555555",
        "street1": "1 Main St.",
        "street2": "Apartment A",
        "city": "Anytown",
        "stateProvince": "KS",
        "postalCode": "12345",
        "country": "USA"
    }
    """

Scenario: Create contact with valid fields
  # Login
  Given path '/users/login'
  And request credentials
  When method POST
  Then status 200
  * def authToken = response.token

  # Create contact
  Given path '/contacts'
  And header Authorization = 'Bearer ' + authToken
  And request contact
  When method POST
  Then status 201
  And match response ==
  """
  {
    "_id": '#string',
    "firstName": '#string',
    "lastName": '#string',
    "birthdate": '#string',
    "email": '#string',
    "phone": '#number',
    "street1": '#string',
    "street2": '#string',
    "city": '#string',
    "stateProvince": '#string',
    "postalCode": '#number',
    "country": '#string',
    "owner": '#string',
    "__v": '#number'
  }
  """