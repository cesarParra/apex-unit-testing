@IsTest
private class Limits_Test {
    // WHAT
    // * There's no need to use Test.startTest and Test.stopTest unless it is being used purposefully
    // * Assert limits, and use Test.startTest/stopTest to ensure you are checking against the appropriate limits

    // DON'T
    @IsTest
    static void dont() {
        // Don't use startTest/stopTest when not needed
        // Note: Nothing wrong with it, but can be confusing if used incorrectly

        Test.startTest();
        // This is set up, so it should not be inside the startTest/stopTest block
        Product__c record = new Product__c(Name = 'Name', Price__c = 100);
        insert record;

        List<Product> products = new ProductsRepository().getProducts(ProductsFilter.none());
        Assert.areEqual(1, Limits.getDmlStatements()); // This is a BAD check, because we are counting the set up DML
        Test.stopTest();

        Assert.areEqual(0, Limits.getQueries()); // This is a BAD check, because we are interested in understanding the limits consumed by what we are testing
        Assert.areEqual(1, products.size());
    }

    // DO
    @IsTest
    static void do_useStartAndStopTestCorrectly_and_checkLimits() {
        // Setup code goes outside of startTest/stopTest.
        Product__c record = new Product__c(Name = 'Name', Price__c = 100);
        insert record;

        Test.startTest();
        List<Product> products = new ProductsRepository().getProducts(ProductsFilter.none());

        Assert.areEqual(0, Limits.getDmlStatements());
        Assert.areEqual(1, Limits.getQueries());
        Test.stopTest();

        Assert.areEqual(1, products.size());
    }

    // WHY
    // * Over-usage of startTest/stopTest when not needed can cause confusion if used incorrectly, consider not using it unless on purpose
    // * Asserting your limits will ensure:
    //     * You are thinking about performance when writing new code
    //     * Think twice about what you are doing if the test fails after modifying the original code
    //     * Will let other devs know (when looking at your PR) that we are making more DB calls, so they might know of ways to avoid that
}
