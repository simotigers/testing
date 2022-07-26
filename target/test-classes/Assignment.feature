Feature: Assignment

  Background: generatetoken for all scenarios
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Add new account to existing email adress
    Given path "/api/accounts/add-primary-account"
    And request {"email": "dk20370@gmail.com","title": "Mr.", "firstName": "driss","lastName": "kada","gender": "MALE","maritakStatus": "Married","employmentStatus": "Software developer","dateOfBirth": "1982-06-08"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 400
    Then print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Account with Email dk20370@gmail.com is exist"

  Scenario: add car to existing account
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = 8388
    And request {"make": "BMW","model": "X7","year": "2024","licensePlate": "tigers"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response

  Scenario: add Phone number to existing account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = 8388
    And request {"phoneNumber": "128-585-9568","phoneExtension": "14","phoneTime": "Morning","phoneType": "Work"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response

  Scenario: add address to existing account
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = 8388
    And request {"addressType": "Home","addressLine1": "123 simo Av","city": "arlington", "state": "VA","postalCode": "22201","countryCode": "10"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response
