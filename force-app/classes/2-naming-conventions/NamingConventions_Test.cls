@IsTest
private class NamingConventions_Test {
    // WHAT
    // * Name should have 3 parts:
    //     * Name of the use case
    //     * Scenario/Condition under which the use case is being tested
    //     * Expectation

    // DON'T
    @IsTest
    static void getProductsTest() {
        // Test here
    }

    // DO
    @IsTest
    static void getProducts_withMaxPriceFilter_expectOnlyProductsAtOrBelowMaxPriceReturned() {
        // Test here
    }

    @IsTest
    static void canFilterByMaxPriceWhenGettingProducts() {
        // Test here
    }

    @IsTest
    static void givenAMaxPrice_whenFilteringProducts_thenReceiveOnlyProductsThatMatchTheMaxPrice() {
        // Test here
    }

    // WHY
    // * Let you see which cases have been covered, which usually let's you know what might be missing (positive and negative tests)
    //     * e.g. For the tests above we can see that we are missing tests for no max price
    // * Let you know what the test is about without having to read the code
}