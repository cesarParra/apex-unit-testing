@IsTest
private class OneCondition_Test {
    static void setupProducts() {
        // Some setup here
    }

    // WHAT
    // * Avoid having multiple test cases in a single unit test

    // DON'T
    @IsTest
    static void canGetFilteredProducts() {
        setupProducts();

        Test.startTest();
        List<Product> allProducts = new ProductsRepository().getProducts(ProductsFilter.none());
        List<Product> filteredProducts = new ProductsRepository().getProducts(ProductsFilter.newInstance().withMaxPrice(100.0));
        Test.stopTest();

        Assert.areEqual(5, allProducts.size(), 'Expected all products');
        Assert.areEqual(1, filteredProducts.size(), 'Expected only products with max size of 100.0');
    }

    // DO
    @IsTest
    static void canGetAllProductsWhenUsingTheNoneFilter() {
        setupProducts();

        Test.startTest();
        List<Product> allProducts = new ProductsRepository().getProducts(ProductsFilter.none());
        Test.stopTest();

        Assert.areEqual(5, allProducts.size(), 'Expected all products');
    }

    @IsTest
    static void canFilterProductsByMaxPrice() {
        setupProducts();

        Test.startTest();
        List<Product> filteredProducts = new ProductsRepository().getProducts(ProductsFilter.newInstance().withMaxPrice(100.0));
        Test.stopTest();

        Assert.areEqual(1, filteredProducts.size(), 'Expected only products with max size of 100.0');
    }

    // WHY
    // * If the test fails, it is clear which use case is failing.
    // * Easier to understand which test cases are covered when looking at the whole file
}