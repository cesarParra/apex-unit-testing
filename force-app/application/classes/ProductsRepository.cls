public with sharing class ProductsRepository implements IProductsRepository {
    /**
     * @description Returns a list of Product based on the received filter.
     * @param filter Contains the conditions to filter by when retrieving products.
     * @return List of products
     * @example
     * // To get all products you can use the filter of none.
     * List<Product> all products = new ProductsRepository().getProducts(Filter.none());
     */
    public List<Product> getProducts(ProductsFilter filter) {
        String query = buildQuery(filter);
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

    private String buildQuery(ProductsFilter filter) {
        String query = 'SELECT Id, Name, Price__c FROM Product__c ' + filter.build();
        return query;
    }
}
