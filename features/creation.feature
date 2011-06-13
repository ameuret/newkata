Feature: Project creation
  In order to quickly start flexing my brain muscles
  as a Ruby developer, I need to create an empty
  kata project with one command
  
  Scenario: Create a kata project
    Given I wish to create a kata for StringCalculator
    When I run `newkata StringCalculator`
    Then the following files should exist:
    | stringcalculator/Gemfile   |
    | stringcalculator/Guardfile |
    And the file "stringcalculator/lib/stringcalculator.rb" should contain "class StringCalculator"
    And the file "stringcalculator/spec/stringcalculator_spec.rb" should contain "describe StringCalculator"

  #  LocalWords:  StringCalculator stringcalculator newkata
  
