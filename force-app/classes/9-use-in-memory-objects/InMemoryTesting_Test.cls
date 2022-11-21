@IsTest
private class InMemoryTesting_Test {
    // WHAT
    // * Avoid, as much as possible, testing with database objects.
    // * Whenever possible test with in memory objects.

    // DON'T
    @IsTest
    static void dont() {
        Product__c record = new Product__c(Name = 'Product Name', Price__c = 100);
        insert record;

        Product productObject = new Product(record);

        Assert.isNotNull(productObject.RecordId);
    }

    // DO
    @IsTest
    static void doInMemory() {
        Product__c record = new Product__c(
            Id = fflib_IDGenerator.generate(Product__c.SObjectType),
            Name = 'Product Name',
            Price__c = 100
        );

        Product productObject = new Product(record);

        Assert.isNotNull(productObject.RecordId);
    }

    // WHY
    // * Calling the DB is veeeeeery slow. Avoid it whenever possible.

    // EXCEPTION
    // * Integration tests
}
