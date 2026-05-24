package runners;

import com.intuit.karate.junit5.Karate;

public class AssignmentFiveTest {

    @Karate.Test
    Karate runAssignmentFive() {

        return Karate.run("classpath:features/assignment5.feature").relativeTo(getClass());
    }
}