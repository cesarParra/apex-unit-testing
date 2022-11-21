@IsTest
private class PublicCode_Test {
    // WHAT
    // * Private methods are implementation details. They serve the bigger picture but by themselves don't really do anything; at some point a public method will call it
    // * Instead of testing or referencing the private method, test the public method that calls it.
    // * This also means: Avoid the @TestVisible annotation in 99.9% of cases.

    // DON'T
    @IsTest
    static void dont() {
        OrderItem item = new OrderItem();

        Boolean validProductPriceAndQuantity = item.hasValidProductPriceAndQuantity();

        Assert.isFalse(validProductPriceAndQuantity);
    }

    // DO
    @IsTest
    static void orderItemPriceIsZeroWhenMissingEnoughDataToCalculatePrice() {
        OrderItem item = new OrderItem();

        Decimal price = item.getPrice();

        Assert.areEqual(0, price);
    }

    // WHY
    // * Private code is subject to change. We should be able to refactor the internals of a class without breaking
    //   the public API, so the tests shouldn't change during a refactoring.
}
