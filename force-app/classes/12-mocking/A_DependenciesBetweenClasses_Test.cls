@IsTest
private class A_DependenciesBetweenClasses_Test {
    // Case -> A class has a dependency on a different class.
    //         We want to test the class with the dependency without having to set up everything about the other class

    // DON'T
    @IsTest
    static void dont_setupEverythingAboutTheDependentClasS() {
        Product product1 = new Product();
        product1.Price = 100;

        Product product2 = new Product();
        product2.Price = 200;

        OrderItem item1 = new OrderItem();
        item1.Quantity = 1;
        item1.Product = product1;

        OrderItem item2 = new OrderItem();
        item2.Quantity = 1;
        item2.Product = product2;

        Order testOrder = new Order();
        testOrder.OrderItems = new List<OrderItem> { item1, item2 };

        Decimal total = testOrder.getTotal();

        Assert.areEqual(300, total);
    }

    // DO
    // 1 -> Prefer depending on interfaces rather than concrete objects
    // 2 -> Create Fake implementations of the interface, and make it easy to return what you want
    @IsTest
    static void do_setupMockVersionsOfTheDependency() {
        IOrderItem item1 = new FakeOrderItem().thatReturnsTotalOf(100);
        IOrderItem item2 = new FakeOrderItem().thatReturnsTotalOf(200);

        Order testOrder = new Order();
        testOrder.OrderItems = new List<IOrderItem> { item1, item2 };

        Decimal total = testOrder.getTotal();

        Assert.areEqual(300, total);
    }

    private class FakeOrderItem implements IOrderItem {
        private Decimal total = 0;

        public FakeOrderItem thatReturnsTotalOf(Decimal total) {
            this.total = total;
            return this;
        }

        public Decimal getTotal() {
            return total;
        }
    }
}
