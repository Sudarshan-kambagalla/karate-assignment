Feature: Assignment 2 - Conditional Scenario Calling

  Scenario: Call scenarios based on even and odd ids

    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts'

    When method GET
    Then status 200

    * def posts = response

    * def processPost =
    """
    function(post){

        var id = post.id;

        if(id % 2 == 0){

            karate.call('classpath:features/evenScenario.feature',
            { id: id });

        } else {

            karate.call('classpath:features/oddScenario.feature',
            { id: id });
        }
    }
    """

    * karate.forEach(posts, processPost)