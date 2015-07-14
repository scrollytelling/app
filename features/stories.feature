Feature: stories

  Background:
    Given I have logged in as administrator

  Scenario:
    When I click "Stories"
    And I click "New Story"
    And I give it the title "Vertical cities"
    Then the story is created
