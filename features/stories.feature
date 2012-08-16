Feature: Story list
	In order to find a news item
	As a user
	I want to see the recent stories

	Background:
		Given the following stories exist:
			| title       | url                          | karma |
			| Google      | http://google.com/           | 1     |
			| Hacker News | http://news.ycombinator.com/ | 1     |

	Scenario: Story list
		Given I am on the homepage
		Then I should see "Google"
		And I should see "Hacker News"

	Scenario: Upvoting
		Given I am on the homepage
		When I follow "▲"
		Then I should be redirected to the homepage
		And I should see "2 points"
