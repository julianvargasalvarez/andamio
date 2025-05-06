Feature: [Feature Name]

  Scenario: [Scenario Name]
    Given [context]
    When [event]
    Then [outcome]

Example:
Feature: Password Reset

  Scenario: User requests password reset
    Given a user is logged in
    When they request a password reset
    Then they receive a reset email
