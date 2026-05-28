Feature: Remove specific key from response

  Background:
    * url 'https://jsonplaceholder.typicode.com'
  Scenario: Remove body key from response
    
    Given path '/posts'

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