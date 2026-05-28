Feature: Even ID Scenario
  Scenario: Validate ID is even

    * print 'Even ID Found ->', id

    * assert id % 2 == 0
