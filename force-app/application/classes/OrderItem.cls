public with sharing class OrderItem implements IOrderItem{
    public Product Product { get; set; }
    public Integer Quantity { get; set; }

    public Money getTotal() {
        if (!hasValidProductPriceAndQuantity()) {
            return Money.zero();
        }
        return Money.of(this.Product.Price.getValue() * this.Quantity);
    }

    public void bomb() {
        throw new InvalidOperationException();
    }

    @TestVisible
    private Boolean hasValidProductPriceAndQuantity() {
        // Returns false if invalid, true if valid
        if (this.Product?.Price == null || this.Quantity == null) {
            return false;
        }
        return true;
    }

    public class InvalidOperationException extends Exception {}
}
