@get
Feature: Consulta del catálogo de productos disponibles

  Scenario: Obtener todos los productos y validar la estructura de la respuesta
    Given url baseUrl
    And path '/api/productsList'
    When method GET
    Then status 200
    And match response.responseCode == 200
    And match response.products == '#array'
    And match response.products[0].id == '#number'
    And match response.products[0].name == '#string'
    And match response.products[0].category == '#object'
