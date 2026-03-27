Feature: GET Products List

  Scenario: Get all products and validate response structure
    Given url baseUrl + '/api/productsList'
    When method GET
    Then status 200
    And match response.responseCode == 200
    And match response.products != null
    And match each response.products == { id: '#number', name: '#string', price: '#string', brand: '#string', category: '#object' }
