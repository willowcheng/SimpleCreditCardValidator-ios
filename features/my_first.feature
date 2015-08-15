Feature: Credit card validation.
  Credit card numbers must be exactly 16 characters.

  Scenario: Credit card number is too long
    Given I wait to see a navigation bar titled "Simple Credit Card Validator"
    When I enter "99999999999999999" into input field number 1
    When I touch the "Validate Credit Card" button
    Then I should see "Credit card number is too long."
