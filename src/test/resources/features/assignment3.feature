    # Assignment 3:
    # Create a csv file using karate commands and pass that file as an input to other files
    # Feature: Create CSV File from API Data
    #      1. Given path is “/posts ”
    #      2. Use get method
    #      3. Create a csv file with the keys and values in the response

Feature: Create CSV and pass to another feature
  
  Background:
    * url 'https://jsonplaceholder.typicode.com'

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
      csvData += post.userId + ',' +
                 post.id + ',' +
                 post.title + '\n';
    }
    """

    * karate.forEach(posts, createCsv)

    * karate.write(csvData, 'posts.csv')

    * call read('classpath:features/readCsv.feature')