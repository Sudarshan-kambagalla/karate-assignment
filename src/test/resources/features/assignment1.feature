    # read JSON response and store it in a json and csv file in a custom folder using java code

    # Given path is “/posts ”
    # Use get method
    # After response received, create a .json file using java code
    # Create a .csv file using java code
Feature: Store API response into JSON and CSV files

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def jsonFilePath = 'output/json/posts.json'
    * def csvFilePath = 'output/csv/posts.csv'
    * def FileUtils = Java.type('utils.FileUtils')
  Scenario:  Validate API response data is stored into files

    Given path '/posts'

    When method GET

    Then status 200
    And match response != null
    And assert response.length > 0
    
    * def jsonData = karate.pretty(response)

    * eval FileUtils.writeJson(jsonFilePath, jsonData)

    * eval FileUtils.writeCsv(csvFilePath, response)