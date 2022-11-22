@IsTest
public with sharing class TestSetup {
    public static void setupEnvironment() {
        new Product_t()
            .withName('Product Name')
            .withPrice(100)
            .persist();
    }
}
