    # execute java script code to create array with the userid values
    # with the response and store the array in a variable

    # 1. Given path is "/posts"
    # 2. Use get method
    # 3. Call javascript code and send the response to java script code
    # 4. Print the updated responses
Feature: Create array using JavaScript

  Background:
    * url 'https://jsonplaceholder.typicode.com'
  Scenario: Create userid array from response
   
    Given path '/posts'

    When method GET

    Then status 200
    And match response != null
    And assert response.length > 0


    * def posts = response
    * def extractUserIds =
    """
    function(data){
        return data.map(function(post){
            return post.userId;
        });
    }
    """
    * def userIdList = extractUserIds(posts)
    
    * match userIdList != null
    * assert userIdList.length > 0

    * print userIdList