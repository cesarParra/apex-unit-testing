@IsTest
private class TestArrangement_Test {
    // WHAT
    // * Setup, Test, Assert (AKA AAA (Arrange, Act, Assert)
    // * Also Given/When/Then

    // DON'T
    @IsTest
    static void dont() {
        Assert.areEqual(Money.zero(), new OrderItem().getTotal());
    }

    // DO
    @IsTest
    static void doArrange() {
        // Setup/Arrange
        OrderItem item = new OrderItem();

        // Test/Act
        Test.startTest(); // Optional
        Money price = item.getTotal();
        Test.stopTest(); // Optional

        // Assert
        Assert.areEqual(Money.zero(), price);
    }

    @IsTest
    static void givenWhenThen() {
        // GIVEN an empty order item
        OrderItem item = new OrderItem();

        // WHEN getting its price
        Test.startTest(); // Optional
        Money price = item.getTotal();
        Test.stopTest(); // Optional

        // THEN the price should be 0
        Assert.areEqual(Money.zero(), price);
    }

    // WHY
    // * Separates what is being tested for readability purposes
    // * Helps when deciding where to put Test.startTest/Test.stopTest
    // * Clarifies what is being tested from the setup
}
