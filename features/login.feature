Feature: logging in

  Scenario:
    When I visit the admin pages
    And I login as an administrator
    Then I see a dashboard
