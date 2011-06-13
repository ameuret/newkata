Feature: Set up an RSpec environment running under Guard
  In order to start coding in serenity
  as a BDD Ruby developer, I need an RSpec set up

  Background:
  Given I run `newkata StringCalculator`

  Scenario: Coding under Guard
    When I cd to "stringcalculator"
    And I run `bundle exec guard` interactively
    And I sleep for 5 seconds
    And I stop the running process
    Then the output should contain "1 example, 0 failures, 1 pending"
  
  #  LocalWords:  StringCalculator stringcalculator newkata
  
