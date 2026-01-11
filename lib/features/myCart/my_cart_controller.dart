import 'package:e_commerce/domain/repositories/cart_product_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/product.dart';

class MyCartController extends ChangeNotifier {
  final CartProductRepository _repository;

  MyCartController({required CartProductRepository repository})
    : _repository = repository;

  List<Product> _products = [];
  bool _isLoading = false;
  double _subTotal = 0.0;
  double _vat = 0.0;
  double _shippingFee = 0.0;
  double _total = 0.0;

  bool get isLoading => _isLoading;

  List<Product> get products => _products;

  double get subTotal => _subTotal;

  double get vat => _vat;

  double get shippingFee => _shippingFee;

  double get total => _total;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final productsData = await _repository.getProducts();
      _products = productsData;
      _shippingFee = 80.0;
      _recalculateTotals();
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void incrementCount(int index) {
    _products[index] = copyWithNewCount(_products[index], _products[index].count + 1);
    _recalculateTotals();
    notifyListeners();
  }

  void decrementCount(int index) {
    if (_products[index].count > 1) {
      _products[index] = copyWithNewCount(_products[index], _products[index].count - 1);
      _recalculateTotals();
      notifyListeners();
    }
  }
  void _recalculateTotals() {
    _subTotal = _products.fold(0, (sum, product) => sum + (product.price * product.count));
    _total = _subTotal + _vat + _shippingFee;
  }

}

Product copyWithNewCount(Product product, int newCount) {
  return Product(
    count: newCount,
    id: product.id,
    name: product.name,
    price: product.price,
    imageUrl: product.imageUrl,
    description: product.description,
    rating: product.rating,
    size: product.size,
    categoryId: product.categoryId,
    numberOfReviews: product.numberOfReviews,
  );
}
