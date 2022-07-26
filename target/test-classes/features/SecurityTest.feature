@smoke
Feature: Security test. Token Generation test

Scenario: generate token with valid username and password.
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

Scenario: generate token with unvalid username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "suprvisor","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"

Scenario: generate token with valid username and invalid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "simo"}
When method post
Then status 400
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "Password Not Matched"