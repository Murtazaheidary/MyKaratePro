@Regression
Feature: TEK Insurance Post Account API

  Background:
    Given url 'https://qa.insurance-api.tekschool-students.com'
    * def tokenGenerator = call read('generateToken.feature@GenerateToken')
    * def getTokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + getTokenValue


  Scenario: Post an Account - Primary Person
    * def generator = Java.type('insurance.api.tek.utility.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def title = generator.getTitle()
    * def gender = generator.getGender()
    * def employmentStatus = generator.getEmploymentStatus()
    * def maritalStatus = generator.getMaritalStatus()
    * def dateOfBirth = generator.getDateOfBirth()
    * path '/api/accounts/add-primary-account'
    * request
      """
      {
  "id": 0,
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "title": "#(title)",
  "gender": "#(gender)",
  "maritalStatus": "#(maritalStatus)",
  "employmentStatus": "#(employmentStatus)",
  "dateOfBirth": "#(dateOfBirth)",
  "new": true
      }
      """
    * method post
    * status 201
    * print response
    * match response.email == email
    * match response.firstName == firstName
    * match response.lastName == lastName
    #this line of the code will store the JSON response into a json file for reusability
    * karate.write(response, 'createdAccount.json')

  @postPhone
  Scenario:  Post Phone - Primary Person
    * def generator = Java.type('insurance.api.tek.utility.DataGenerator')
    * def phoneNumber = generator.getPhoneNumber()
    * def phoneExtension = generator.getPhoneExtension()
    * def phoneTime = generator.getPhoneTime()
    * def phoneType = generator.getPhoneType()
    * path '/api/accounts/add-account-phone'
    * def primaryPersonIdValue = read('file:./target/createdAccount.json')
    * param primaryPersonId = primaryPersonIdValue.id
    * request
    """
    {
  "phoneNumber": "#(phoneNumber)",
  "phoneExtension": "#(phoneExtension)",
  "phoneTime": "#(phoneTime)",
  "phoneType": "#(phoneType)"
    }
    """
    * method post
    * status 201
    * print response
    * match response.phoneNumber == phoneNumber
    * def phoneId = response.id
    * print phoneId