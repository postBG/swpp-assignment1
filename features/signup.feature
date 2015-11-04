Feature: User can signup

Scenario: User tries to signup
Given I am on my homepage
When I signup as "username" with "password"
Then I see my counter
