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

  Scenario: Specify a lower-cased name
    When I run `newkata stringcalculator`
    Then the output should contain "The name argument must be usable as a Ruby class name"


  Scenario: Creating a gem kata
    When I run `newkata StringCalculator --gem`
    Then the following files should exist:
    | stringcalculator/Rakefile   |
    | stringcalculator/stringcalculator.gemspec |
    And the file "stringcalculator/stringcalculator.gemspec" should contain "stringcalculator"
    And the file "stringcalculator/Gemfile" should contain "# Statements produced by 'bundle gem'"
    And the file "stringcalculator/Gemfile" should contain "# Statements produced by newkata"
    
  #  LocalWords:  StringCalculator stringcalculator newkata
  
