Feature: List of Airports
  As an API consumer
  I want to list all popular airports
  So that I can make better informed travel decisions.

  Scenario: I should be able to list all airports
    When I GET /airports?apikey=NZrE6dsDKt9QK9NoTAMWbqA3tPYtPBINozjK8gs0rwAriopM
    Then response code should be 200
    And response body path $ should be of type array with length 50

  Scenario: I should be able to limit the number of returned airports
    When I GET /airports?limit=42&apikey=NZrE6dsDKt9QK9NoTAMWbqA3tPYtPBINozjK8gs0rwAriopM
    Then response code should be 200
    And response body path $ should be of type array with length 42

  Scenario: I should find all airports for a given country filter
    When I GET /airports?country=india&apikey=NZrE6dsDKt9QK9NoTAMWbqA3tPYtPBINozjK8gs0rwAriopM
    Then response code should be 200
    And response body path $ should be of type array with length 2
    And response body path $.[0].iata should be DEL
    And response body path $.[1].iata should be BOM

  Scenario: I should be given an empty array for a non existing country name
    When I GET /airports?country=utopia&apikey=NZrE6dsDKt9QK9NoTAMWbqA3tPYtPBINozjK8gs0rwAriopM
    Then response code should be 200
    And response body path $ should be of type array with length 0
