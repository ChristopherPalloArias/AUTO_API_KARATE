@delete
Feature: Eliminación de cuenta de usuario registrado

  Scenario: Crear usuario y eliminar la cuenta validando la confirmación de baja
    * def timestamp = '' + java.lang.System.currentTimeMillis()
    * def email = 'christophersofka_' + timestamp + '@test.com'

    # Setup: crear usuario con email dinámico
    Given url baseUrl
    And path '/api/createAccount'
    And form field name = 'Christopher Sofka'
    And form field email = email
    And form field password = 'Test@1234'
    And form field title = 'Mr'
    And form field birth_date = '15'
    And form field birth_month = '6'
    And form field birth_year = '1990'
    And form field firstname = 'Christopher'
    And form field lastname = 'Sofka'
    And form field company = 'Sofka Technologies'
    And form field address1 = '123 Main Street'
    And form field address2 = 'Suite 100'
    And form field country = 'United States'
    And form field zipcode = '10001'
    And form field state = 'New York'
    And form field city = 'New York'
    And form field mobile_number = '1234567890'
    When method POST
    Then status 200
    And match response.responseCode == 201

    # Eliminar la cuenta y validar la respuesta de baja
    Given url baseUrl
    And path '/api/deleteAccount'
    And form field email = email
    And form field password = 'Test@1234'
    When method DELETE
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'Account deleted!'
