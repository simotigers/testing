Feature: Creat Account
Background: generatetoken for all scenarios
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def generatedToken = response.token

Scenario: Creat new Account happy path
Given path "/api/accounts/add-primary-account"
And request {"email": "mohammad@gmail.com","title": "Mr.", "firstName": "mohammad","lastName": "Shokriyan","gender": "MALE","maritakStatus": "SINGLE","employmentStatus": "Software developer","dateOfBirth": "1988-02-27"}
And header Authorization = "Bearer " + generatedToken
When method post
Then print response
Then status 201
