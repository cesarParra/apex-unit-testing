@IsTest
private class DataBuilder_Test {
    // WHAT
    // * Prefer a data builder over Test Setup and Test Data creator classes

    // DON'T
    @IsTest
    static void dont() {
        // It is not very clear what is going on behind the scenes when this method is called.
        TestSetup.setupEnvironment();
        // To get data out we need to query it, which makes tests slower
        Product__c record = [SELECT Name, Price__c FROM Product__c LIMIT 1];

        // Rest of the test....
    }

    // DO
    @IsTest
    static void doBuilder() {
        // Clarity behind what is going on
        // No need to query
        Product__c record = (Product__c)new Product_t()
            .name('Product Name')
            .price(100)
            .persist();

        // Rest of the test...
    }

    // WHY
    // * Clarity behind what is being set up
    // * Easy to set up different tests with different conditions
    // * No need to query for the records back
}
