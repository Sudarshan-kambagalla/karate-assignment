package runners;

import com.intuit.karate.junit5.Karate;

public class AssignmentThreeTest {

    @Karate.Test
    Karate runAssignmentThree() {

        return Karate.run("classpath:features/assignment3.feature").relativeTo(getClass());
    }
}