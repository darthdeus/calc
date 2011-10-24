Feature: Calculator
  In order to do my homework
  As a student
  I want to have a functioning calculator

  
  Background:
    Given I run `calc.rb` interactively
  
  Scenario: Basic addition
    When I input following formula "1 + 1"
    Then the output should contain: 
    """
     1
    +1
    --
     2
    """

  Scenario: Single digit multiplication
    When I input following formula "2 * 2"
    Then the output should contain:
    """
     2
    *2
    --
     4
    """  
  
  Scenario: First number multiple digit multiplication
    When I input following formula "22 * 2"
    Then the output should contain:
    """
    22
    *2
    --
    44
    """

  Scenario: Second number multiple digit multiplication
    When I input following formula "2 * 22"
    Then the output should contain:
    """
     2
   *22
   ---
     4
    4 
    --
    44
    """


  Scenario: Both numbers multiple digit multiplication
    When I input following formula "22 * 22"
    Then the output should contain:
    """
     22
    *22
    ---
     44
    44 
    ---
    484
    """





