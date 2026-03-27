import com.intuit.karate.junit5.Karate;

class AutomationExerciseTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
