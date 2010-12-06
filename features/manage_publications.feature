Feature: Manage publications
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new publication
    Given I am on the new publication page
    When I fill in "Title" with "title 1"
    And I fill in "Subtitle" with "subtitle 1"
    And I fill in "Name" with "name 1"
    And I fill in "publication_welcome_editor" with "welcome 1"
    And I fill in "Copyright" with "copyright 1"
    And I fill in "Issn" with "issn 1"
    And I fill in "Publisher" with "publisher 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "subtitle 1"
    And I should see "name 1"
    And I should see "welcome 1"
    And I should see "copyright 1"
    And I should see "issn 1"
    And I should see "publisher 1"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  Scenario: Delete publication
    Given the following publications:
      |title|subtitle|name|welcome|copyright|issn|publisher|
      |title 1|subtitle 1|name 1|welcome 1|copyright 1|issn 1|publisher 1|
      |title 2|subtitle 2|name 2|welcome 2|copyright 2|issn 2|publisher 2|
      |title 3|subtitle 3|name 3|welcome 3|copyright 3|issn 3|publisher 3|
      |title 4|subtitle 4|name 4|welcome 4|copyright 4|issn 4|publisher 4|
    When I delete the 3rd publication
    Then I should see the following publications:
      |Title|Subtitle|Name|Welcome|Copyright|Issn|Publisher|
      |title 1|subtitle 1|name 1|welcome 1|copyright 1|issn 1|publisher 1|
      |title 2|subtitle 2|name 2|welcome 2|copyright 2|issn 2|publisher 2|
      |title 4|subtitle 4|name 4|welcome 4|copyright 4|issn 4|publisher 4|
