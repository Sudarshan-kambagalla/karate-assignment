    # read JSON response and store it in a json and csv file in a custom folder using java code

    # Given path is “/posts ”
    # Use get method
    # After response received, create a .json file using java code
    # Create a .csv file using java code
Feature: Assignment 1 - Store API response into JSON and CSV files
  Scenario: Create JSON and CSV files from API response

    Given url 'https://jsonplaceholder.typicode.com'

    And path '/posts'

    When method GET

    Then status 200

    * print response

    * def jsonData = karate.pretty(response)

    * def FileUtils = Java.type('utils.FileUtils')


    * eval FileUtils.writeJson('output/json/posts.json',jsonData)

    * eval FileUtils.writeCsv('output/csv/posts.csv',response)