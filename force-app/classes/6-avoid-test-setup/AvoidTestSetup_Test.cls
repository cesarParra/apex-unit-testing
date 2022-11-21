@IsTest
private class AvoidTestSetup_Test {
    // WHAT
    // * Prefer a helper method than using @TestSetup

    // DON'T
    @TestSetup
    static void setup() {
        // Some setup here
    }

    @IsTest
    static void dont() {
        // Rely on setup here
    }

    // DO
    static void setupSomething() {
        // Some setup here
    }

    static void setupSomethingDifferent() {
        // Some other setup here
    }

    @IsTest
    static void test1() {
        // Explicitly call the specific setup method you need
        setupSomething();

        /// Rest of the test
    }

    // WHY
    // * More clarity when reading the code since you are explicitly calling the setup method, so you can clearly understand
    //   what got set up.
    // * Avoid setting too much or too little
    // * Salesforce is pretty slow when calling the DB, so avoid slowing down tests that don't need records in the DB
    // * Avoid assumption that all tests have a similar setup. If we set up all tests the same way we will want to test
    //   against the specific set up, so we will naturally avoid testing other things
    //   ** E.g. It makes harder to test the case of no records in the DB, so we will just avoid testing for that
}
