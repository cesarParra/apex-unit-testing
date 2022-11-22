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
            Id = fflib_IDGenerator.generate(Product__c.SObjectType)
            // Name = 'Product Name', No Need to set up information we are not interested in for this test, even if it is required
            // Price__c = 100
        );

        Product productObject = new Product(record);

        Assert.isNotNull(productObject.RecordId);
    }

    // WHY
    // * Calling the DB is veeeeeery slow. Avoid it whenever possible.
    // * Once an application gets relatively big, when running unit tests in parallel, Row Lock errors (UNABLE_TO_LOCK_ROW)
    //   will start happening when there are a lot of tests calling into the DB at the same time.
    // * If the object has a lot of validations (e.g. required fields, validation rules, triggers) then you might need
    //   to set a lot of data that you don't need for the test just to make things work


    // Time Comparison
    @IsTest
    static void withDbCalls_time() {
        for (Integer i = 0; i < 20; i++) {
            Contact_t con = new Contact_t();
            Opportunity_t opp = new Opportunity_t();

            new Account_t()
                .add(new Contact_t())
                .add(con)
                .add(opp
                    .add(con))
                .persist();
        }
        System.debug('TIME:: ' + Limits.getCpuTime());
    }

    @IsTest
    static void inMemory_time() {
        for (Integer i = 0; i < 20; i++) {
            Contact_t con = new Contact_t();
            Opportunity_t opp = new Opportunity_t();

            new Account_t()
                .add(new Contact_t())
                .add(con)
                .add(opp
                    .add(con));
        }
        System.debug('TIME:: ' + Limits.getCpuTime());
    }

    // EXCEPTION
    // * Integration tests

    /**
     * @description <h1>Testing pyramid</h1>
     * <img src="https://global-uploads.webflow.com/619e15d781b21202de206fb5/628b0dca3e6eda9219d40a6a_The-Testing-Pyramid-Simplified-for-One-and-All-1280X720%20(1).jpg" />
     */
    @IsTest
    static void integrationTest() { }
}
