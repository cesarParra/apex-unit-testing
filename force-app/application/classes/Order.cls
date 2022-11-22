public with sharing class Order {
    public List<IOrderItem> OrderItems { get; set; }

    public Decimal getTotal() {
        if (this.OrderItems == null) {
            return 0;
        }
        Decimal total = 0;
        for (IOrderItem item : this.OrderItems) {
            total += item.getTotal();
        }
        return total;
    }
}
