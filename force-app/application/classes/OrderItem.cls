public with sharing class OrderItem {
    public Product Product { get; set; }
    public Integer Quantity { get; set; }

    public Decimal getPrice() {
        if (!hasValidProductPriceAndQuantity()) {
            return 0;
        }
        return this.Product.Price * this.Quantity;
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
