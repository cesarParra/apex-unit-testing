public with sharing class ProductsFilter {
    public Decimal MaxPrice { get; set; }

    public static ProductsFilter newInstance() {
        return new ProductsFilter();
    }

    public static ProductsFilter none() {
        return new ProductsFilter();
    }

    public ProductsFilter withMaxPrice(Decimal maxPrice) {
        this.MaxPrice = maxPrice;
        return this;
    }

    public String build() {
        if (this.MaxPrice == null) {
            return '';
        }

        return 'WHERE Price__c <= ' + this.MaxPrice;
    }
}