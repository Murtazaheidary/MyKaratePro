Feature: Tek Insurance GET Account API

  Background:Setup GET Account test
    Given url 'https://qa.insurance-api.tekschool-students.com'
    * def tokenGenerator = call read('generateToken.feature@GenerateToken')
    * def tokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + tokenValue


  Scenario: Get Primary Person Account
    * path '/api/accounts/get-primary-account'
    * param primaryPersonId = 2558
    * method get
    * status 200
    * print response
    * match response.firstName == 'Murtaza'
    * match response.lastName == 'Heidary'
    * match response.gender == 'MALE'
    * match response.id == 2558
    * match response.email contains '@school1.gov'


  Scenario: Get All Accounts
    * path '/api/accounts/get-all-accounts'
    * method get
    * status 200
    * print response[0]
   # * match response[0].firstName == 'Shokriyan'


  Scenario: Get Account Details
    * path '/api/accounts/get-account'
    * param primaryPersonId = 2558
    * method get
    * status 200
    * print response
    * def idValue = response.primaryPerson.id
    * match idValue == 2558
    * match response.primaryPersonCars[0].licensePlate == 'Kabul'
    #* match response.user.accountType == 'CUSTOMER'
   # * match response.user.authorities[0].role == 'CUSTOMER'
