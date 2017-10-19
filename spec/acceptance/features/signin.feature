Feature: The signin process
  Scenario: I can open login page via menu
    Given there is a home page
    When I click login
    Then login page should open

  Scenario: I can login with correct credentials
    Given there is a login page
    When I fill 'lopandya96@gmail.com' in email and 'lopandya96' in password
    And click enter
    Then login should be successful

  Scenario: I can not login with blank password
    Given there is a login page
    When I fill 'lopandya96@gmail.com' in email and '' in password
    And click enter
    Then login should be failed

  Scenario: I can not login with blank email
    Given there is a login page
    When I fill '' in email and 'lopandya96' in password
    And click enter
    Then login should be failed

  Scenario: I can not login with blank data
    Given there is a login page
    When I fill '' in email and '' in password
    And click enter
    Then login should be failed

  Scenario: I can not login with incorrect email
    Given there is a login page
    When I fill 'FALSE@i.ua' in email and 'lopandya96' in password
    And click enter
    Then login should be failed

  Scenario: I can not login with incorrect password
    Given there is a login page
    When I fill 'lopandya96@gmail.com' in email and 'FALSE' in password
    And click enter
    Then login should be failed

  Scenario: I can not login with incorrect data
    Given there is a login page
    When I fill 'FALSE@gmail.com' in email and 'FALSE' in password
    And click enter
    Then login should be failed