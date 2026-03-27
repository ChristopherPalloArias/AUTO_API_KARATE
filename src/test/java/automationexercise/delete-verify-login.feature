Feature: DELETE Verify Login - Method Not Supported

  Scenario: Send DELETE to verify login and validate method not supported error
    Given url baseUrl + '/api/verifyLogin'
    When method DELETE
    Then status 200
    And match response.responseCode == 405
    And match response.message == 'This request method is not supported.'
