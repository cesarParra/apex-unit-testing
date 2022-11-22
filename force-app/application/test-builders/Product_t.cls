public with sharing class Product_t extends DomainBuilder {
    public Product_t() {
        super(Product__c.SObjectType);
    }

    public Product_t withName(String name) {
        return (Product_t)set(Product__c.Name, name);
    }

    public Product_t withPrice(Decimal price) {
        return (Product_t)set(Product__c.Price__c, price);
    }
}
