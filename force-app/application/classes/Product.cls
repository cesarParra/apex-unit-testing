public with sharing class Product {
    public Id RecordId { get; set; }
    public String Name { get; set; }
    public Money Price { get; set; }

    public Product() { }

    public Product(Product__c productRecord) {
        this.RecordId = productRecord.Id;
        this.Name = productRecord.Name;
        this.Price = Money.of(productRecord.Price__c);
    }
}
