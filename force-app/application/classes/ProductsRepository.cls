public with sharing class ProductsRepository {
    public List<Product> getProducts(ProductsFilter filter) {
        String query = 'SELECT Id, Name, Price__c FROM Product__c ' + filter.build();
        List<Product__c> records = Database.query(query);

        List<Product> products = new List<Product>();
        for (Product__c record : records) {
            Product productObj = new Product();
            productObj.Name = record.Name;
            productObj.Price = record.Price__c;
            products.add(productObj);
        }
        return products;
    }
}