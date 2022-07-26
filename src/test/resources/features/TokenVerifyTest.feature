Feature: Security test. verify Token test
Scenario: Verify valid token
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def generatedtoken = response.token
Given path "api/token/verify"
And param username = "supervisor"
And param token = generatedtoken
When method get
Then status 200
And print response
Scenario: Verify unvalid token
Given url "https://tek-insurance-api.azurewebsites.net"
And path "api/token/verify"
And param username = "supervisor"
And param token = "invalid-token-random-string"
When method get
Then status 400
And print response

Scenario: Verify valid token with invalid username

Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def generatedtoken = response.token
Given path "api/token/verify"
And param username = "invalid username"
And param token = generatedtoken
When method get
Then status 400
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "Wrong Username send along with Token"

