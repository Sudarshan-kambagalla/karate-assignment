    # execute java script code to create array with the userid values
    # with the response and store the array in a variable

    # 1. Given path is "/posts"
    # 2. Use get method
    # 3. Call javascript code and send the response to java script code
    # 4. Print the updated response
Feature: Assignment 5 - Create array using JavaScript
  Scenario: Create userid array from response
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts'
    When method GET
    Then status 200

    * def posts = response
    * def extractUserIds =
    """
    function(data){
        var userIds = [];
        for(var i = 0; i < data.length; i++){
            userIds.push(data[i].userId);
        }
        return userIds;
    }
    """
    * def userIdArray = extractUserIds(posts)
    * print userIdArray