@IsTest
private class B_DependenciesOnData_Test {
    // DON'T call the db to set up the records
    @IsTest
    static void dont() {
        new Product_t().withName('A Name').withPrice(100).persist();

        List<Product> products = ProductsController.getAllProducts();

        Assert.areEqual(1, products.size());
    }

    // DO
    // Same as A
    @IsTest
    static void do_mockTheDependency() {
        List<Product__c> records = new List<Product__c> {
            (Product__c)new Product_t().record,
            (Product__c)new Product_t().record
        };

        IProductsRepository fakeRepo = new FakeProductsRepository().withFakeProducts(records);

        // Inject the dependency
        ProductsController.repository = fakeRepo;

        List<Product> products = ProductsController.getAllProducts();

        Assert.areEqual(2, products.size());
    }

    private class FakeProductsRepository implements IProductsRepository {
        private List<Product> fakeProducts = new List<Product>();

        public FakeProductsRepository withFakeProducts(List<Product__c> records) {
            List<Product> products = new List<Product>();
            for (Product__c record : records) {
                products.add(new Product(record));
            }
            fakeProducts = products;
            return this;
        }

        public List<Product> getProducts(ProductsFilter filter) {
            return fakeProducts;
        }
    }

    // Alternative - Using fflib
    @IsTest
    static void do_use_fflibApexMocks() {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Product mockProduct = (Product)mocks.mock(Product.class);
        IProductsRepository mockRepository = (IProductsRepository)mocks.mock(IProductsRepository.class);

        mocks.startStubbing();
        mocks.when(mockRepository.getProducts((ProductsFilter)fflib_Match.anyObject()))
            .thenReturn(new List<Product> { mockProduct });
        mocks.stopStubbing();

        // Inject the dependency
        ProductsController.repository = mockRepository;

        List<Product> products = ProductsController.getAllProducts();

        Assert.areEqual(1, products.size());
    }
}
