Feature: PUT Brands List - Method Not Supported

  Scenario: Send PUT to brands list and validate method not supported error
    Given url baseUrl + '/api/brandsList'
    When method PUT
    Then status 200
    And match response.responseCode == 405
    And match response.message == 'This request method is not supported.'
