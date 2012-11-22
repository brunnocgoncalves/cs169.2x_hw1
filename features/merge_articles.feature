Feature: Merge Articles
  As a blog administrator
  In order to reduce duplication on the blog
  I want to merge two similar articles into one

  Background:
    Given the blog is set up
    And the following articles exist:
    | title         | author        | body                                         | published |
    | A first post  | First Author  | The text in the first blog post.             | true      |
    | A second post | Second Author | Followed by the text in a similar blog post. | true      |
    And the following users exist:
    | login         | password         | email                    | name             | profile_id |
    | publisher     | publisher_pw     | publisher@domain.org     | Blog Publisher   | 2          |
    | administrator | administrator_pw | administrator@domain.org | Blog Admin       | 1          |

  Scenario: An admin can see the option to merge articles
    Given I am logged into the admin panel as "administrator"
    And I visit the the edit page for "A first post"
    Then I should see "Merge Articles"

  Scenario: A non-admin cannot see the option to merge articles
    Given I am logged into the admin panel as "publisher"
    And I visit the the edit page for "A first post"
    Then I should not see "Merge Articles"

  Scenario: Merged article should contain text of both articles
    Given I am logged into the admin panel as "administrator"
    And I visit the the edit page for "A first post"
    And I attempt to merge with "A second post"
    And I revisit the the edit page for "A first post"
    Then I should see "The text in the first blog post.Followed by the text in a similar blog post."

  # Scenario: Merged article should contain comments of both articles
  #   Given that the first article contains comments with id: 1, 2
  #   And the second article contains comments with id: 3, 4, 5
  #   And the articles are merged
  #   Then the merged articles should contain comments with id: 1, 2, 3, 4, 5

##  Scenario: Merged article should have title of either article
##    Given that the first article has title "First Article"
##    Given that the second article has title "Second Article"
##    And the articles are merged
##    Then the merged article should have the title "First Article" or "Second Article"
##
##  Scenario: Merged article should have author of either article
##    Given that the first article has author "First Author"
##    Given that the second article has author "Author Second"
##    And the articles are merged
##    Then the merged article should have the title "First Author" or "Author Second"
##
##

