    # Assignment 3:
    # Create a csv file using karate commands and pass that file as an input to other files
    # Feature: Create CSV File from API Data
    #      1. Given path is “/posts ”
    #      2. Use get method
    #      3. Create a csv file with the keys and values in the response

Feature: Create CSV and pass to another feature

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def csvFilePath = 'target/posts.csv'
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
  Scenario: Create CSV file from API response

    Given path '/posts'

    When method GET

    Then status 200
    And match response != null
    And assert response.length > 0

    * def posts = response

    * def csvData = 'userId,id,title\n'

    * def createCsv =
    """
    function(post){
      // Convert response object into CSV row format
      csvData += post.userId + ',' +
                 post.id + ',' +
                 post.title + '\n';
    }
    """

    * karate.forEach(posts, createCsv)

    * karate.write(csvData, csvFilePath)
    
    # Verify posts.csv file exists
    * def fileExists = Files.exists(Paths.get(csvFilePath))
    * match fileExists == true

    * call read('classpath:features/readCsv.feature')