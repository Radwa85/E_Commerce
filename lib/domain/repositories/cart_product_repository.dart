import '../entities/product.dart';

abstract class CartProductRepository {
  Future<List<Product>> getProducts();
}
