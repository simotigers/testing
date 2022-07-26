Feature: Creat an account and add adress to the account

  Background: creat new account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def creataccountresult = callonce read("CreatAccountFeature.feature")
    And print creataccountresult
    * def primaryPersonId = creataccountresult.response.id
    * def token = creataccountresult.result.response.token

  Scenario: Add adress to an account
    Given path '/api/accounts/add-account-address'
    And param primaryPersonId = primaryPersonId
    And header Authorization = "Bearer " + token
    Given request
      """
      {
      "addressType": "Home",
      "addressLine1": "125 st s",
      "city": "rabat",
      "state": "VA",
      "postalCode": "12358",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
