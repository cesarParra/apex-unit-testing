public with sharing class ProductsController {
    @TestVisible static IProductsRepository repository;

    static {
        repository = new ProductsRepository();
    }

    public class ProductDto {
        @AuraEnabled
        public String Name { get; set; }

        @AuraEnabled
        public Decimal Price { get; set; }

        public ProductDto(Product productObject) {
            this.Name = productObject.Name;
            this.Price = productObject.Price.getValue();
        }
    }

    @AuraEnabled(Cacheable=true)
    public static List<Product> getAllProducts() {
        try {
            return repository.getProducts(ProductsFilter.none());
        } catch (Exception e) {
            AuraHandledException auraHandledException = new AuraHandledException(e.getMessage());
            auraHandledException.setMessage(e.getMessage());
            throw auraHandledException;
        }
    }
}
