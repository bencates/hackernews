Feature: Comments
  In order to respond to a story
  As a user
  I want to comment on that story

  Scenario: Comment submission
    Given a story exists
    And I am on the story's page
    When I fill in "comment[body]" with "This is a comment"
    And I press "add comment"
    Then I should be on the story's page
    And I should see "This is a comment"

	Scenario: Upvoting
    Given a comment exists
    And I am on the comment's page
		When I follow "▲"
		Then I should be on the comment's page
		And I should see "2 points"

  Scenario: Nested comments
    Given a comment exists
    And I am on the comment's page
    When I fill in "comment[body]" with "This is a child comment"
    And I press "add comment"
    Then I should be on the comment's page
    And I should see "This is a child comment"
