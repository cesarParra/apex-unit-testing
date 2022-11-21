@IsTest
private class WhatTo_Test {
    // WHAT
    // * Test use cases over specific methods

    // DON'T
    @IsTest
    static void canSetMaxPrice() {
        ProductsFilter filter = ProductsFilter.newInstance().withMaxPrice(100.0);

        Assert.areEqual(100.0, filter.MaxPrice);
    }

    // DO
    @IsTest
    static void filtersAreBuiltCorrectlyWhenMaxPriceIsSet() {
        String result = ProductsFilter.newInstance().withMaxPrice(100.0).build();

        // By testing the build() is working, we are also implicitly testing that withMaxPrice is doing the correct thing
        Assert.areEqual('WHERE Price__c <= 100.0', result);
    }

    // WHY
    // * So tests are meaningful. Passing tests should reflect that the functionality is actually working, not every single thing the code does.
    // * To avoid boredom when writing tests. Tests should not be a chore
}