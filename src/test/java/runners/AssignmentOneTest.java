package runners;

import com.intuit.karate.junit5.Karate;

public class AssignmentOneTest {

    @Karate.Test
    Karate runAssignmentOne() {

        return Karate.run("classpath:features/assignment1.feature").relativeTo(getClass());
    }
}