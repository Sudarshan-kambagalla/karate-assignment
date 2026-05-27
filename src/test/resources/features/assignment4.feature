Feature: Assignment 4 - Remove specific key from response
  Scenario: Remove body key from response
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts'
    When method GET
    Then status 200
    * def posts = response
    * def removeBody =
    """
    function(post){
        delete post.body;
        return post;
    }
    """
    * def updatedResponse = karate.map(posts, removeBody)
    * print updatedResponse