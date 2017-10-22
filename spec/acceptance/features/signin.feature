Feature: The signin process
  Scenario: User can open login page via menu
    Given I am on home page
    When I click login
    Then I should see login page

  Scenario: User can login with correct credentials
    Given I am on login page
    When I fill out correct email and correct password
    And I press enter key
    Then I should be logged in successfully

  Scenario: User can not login with blank password
    Given I am on login page
    When I fill out correct email and no password
    And I press enter key
    Then I should not be logged in

  Scenario: User can not login with blank email
    Given I am on login page
    When I fill out no email and correct password
    And I press enter key
    Then I should not be logged in

  Scenario: User can not login with blank data
    Given I am on login page
    When I fill out no email and no password
    And I press enter key
    Then I should not be logged in

  Scenario: User can not login with incorrect email
    Given I am on login page
    When I fill out incorrect email and correct password
    And I press enter key
    Then I should not be logged in

  Scenario: User can not login with incorrect password
    Given I am on login page
    When I fill out correct email and incorrect password
    And I press enter key
    Then I should not be logged in

  Scenario: User can not login with incorrect data
    Given I am on login page
    When I fill out incorrect email and incorrect password
    And I press enter key
    Then I should not be logged in