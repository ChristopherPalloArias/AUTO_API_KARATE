Feature: POST Search Product

  Scenario: Search products by keyword and validate results
    Given url baseUrl + '/api/searchProduct'
    And form field search_product = 'top'
    When method POST
    Then status 200
    And match response.responseCode == 200
    And match response.searchedProducts != null
    And match response.searchedProducts[0] == { id: '#number', name: '#string', price: '#string', brand: '#string', category: '#object' }
