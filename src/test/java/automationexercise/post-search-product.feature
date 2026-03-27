Feature: POST Search Product

  Scenario: Search products by keyword and validate results
    Given url baseUrl + '/api/searchProduct'
    And form field search_product = 'top'
    When method POST
    Then status 200
    And match response.responseCode == 200
    And match response == '#object'
