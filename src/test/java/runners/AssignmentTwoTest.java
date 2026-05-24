package runners;

import com.intuit.karate.junit5.Karate;

public class AssignmentTwoTest {

    @Karate.Test
    Karate runAssignmentTwo() {

        return Karate.run("classpath:features/assignment2.feature").relativeTo(getClass());
    }
}
