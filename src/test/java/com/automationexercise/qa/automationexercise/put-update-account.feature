@put
Feature: Actualización de datos de cuenta de usuario existente

  Scenario: Crear usuario, actualizar sus datos y validar la confirmación de actualización
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

    # Actualizar los datos del usuario registrado
    Given url baseUrl
    And path '/api/updateAccount'
    And form field name = 'Christopher Sofka Updated'
    And form field email = email
    And form field password = 'Test@1234'
    And form field title = 'Mr'
    And form field birth_date = '20'
    And form field birth_month = '8'
    And form field birth_year = '1992'
    And form field firstname = 'Christopher'
    And form field lastname = 'Sofka Updated'
    And form field company = 'Sofka Technologies'
    And form field address1 = '456 New Street'
    And form field address2 = 'Suite 200'
    And form field country = 'United States'
    And form field zipcode = '20002'
    And form field state = 'California'
    And form field city = 'Los Angeles'
    And form field mobile_number = '0987654321'
    When method PUT
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'User updated!'

    # Cleanup: eliminar el usuario creado en este escenario
    Given url baseUrl
    And path '/api/deleteAccount'
    And form field email = email
    And form field password = 'Test@1234'
    When method DELETE
    Then status 200
