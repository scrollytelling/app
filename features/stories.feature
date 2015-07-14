Feature: stories

  Background:
    Given I have logged in as administrator

  Scenario: I can create a story
    When I click "Stories"
    And I click "New Story"
    And I give it the title "Vertical cities"
    And I click "Create Story"
    Then I see "Story was successfully created"

  Scenario: I can change a story
    Given a story "Vertical cities"
    When I click "Stories"
    And I click "Vertical cities"
    And I click "Edit Story"
    And I give it the title "Horizontal cities"
    And I click "Update Story"
    Then I see "Story was successfully updated"

  Scenario: I can delete a story
    Given a story "Vertical cities"
    When I click "Stories"
    And I click "Vertical cities"
    And I click "Delete Story"
    Then I see "Story was successfully destroyed"
