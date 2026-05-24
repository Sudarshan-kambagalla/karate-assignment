package runners;

import com.intuit.karate.junit5.Karate;

public class AssignmentFourTest {
    @Karate.Test
    Karate runAssignmentFour() {
        return Karate.run("classpath:features/assignment4.feature").relativeTo(getClass());
    }
}