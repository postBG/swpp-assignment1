Feature: User can login

Scenario: User tries to login
Given I signed up as "username" with "password"
And I am on my homepage
When I login as "username" with "password"
Then I see my counter
