@IsTest
public with sharing class TestSetup {
    public static void setupEnvironment() {
        new Product_t()
            .name('Product Name')
            .price(100)
            .persist();
    }
}
