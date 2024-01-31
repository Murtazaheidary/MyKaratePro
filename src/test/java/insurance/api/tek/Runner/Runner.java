package insurance.api.tek.Runner;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:insurance/api/tek/Feature").tags("@GenerateToken").relativeTo(getClass());
    }
}
