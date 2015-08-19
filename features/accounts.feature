Feature: accounts

  Background:
    Given I have logged in as administrator

  Scenario: I can create an account
    When I click "Accounts"
    And I click "New Account"
    And I give it the name "WDR"
    And I click "Create Account"
    Then I see "Account was successfully created"

  Scenario: I can change an account
    Given an account "WDR"
    When I click "Accounts"
    And I click "WDR"
    And I click "Edit Account"
    And I give it the name "ZDF"
    And I click "Update Account"
    Then I see "Account was successfully updated"

  Scenario: I can delete an account
    Given an account "WDR"
    When I click "Accounts"
    And I click "WDR"
    And I click "Delete Account"
    Then I see "Account was successfully destroyed"
