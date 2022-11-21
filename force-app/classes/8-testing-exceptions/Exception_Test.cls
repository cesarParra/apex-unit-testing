@IsTest
private class Exception_Test {
    @IsTest
    static void testingAnExceptionIsThrown() {
        OrderItem item = new OrderItem();
        try {
            item.bomb();
            Assert.fail('Expected an exception to have been thrown.');
        } catch (Exception e) {
            Assert.isInstanceOfType(e, OrderItem.InvalidOperationException.class);
        }
    }
}
