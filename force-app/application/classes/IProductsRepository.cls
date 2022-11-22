public interface IProductsRepository {
    List<Product> getProducts(ProductsFilter filter);
}
