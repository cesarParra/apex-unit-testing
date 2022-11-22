public with sharing class Order {
    public List<IOrderItem> OrderItems { get; set; }

    public Money getTotal() {
        if (this.OrderItems == null) {
            return Money.zero();
        }
        List<Money> monies = new List<Money>();
        for (IOrderItem item : this.OrderItems) {
            monies.add(item.getTotal());
        }
        return Money.sum(monies);
    }
}
