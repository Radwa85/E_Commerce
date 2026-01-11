
import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/domain/entities/category.dart';
import 'package:e_commerce/domain/entities/product.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';

import '../../domain/repositories/cart_product_repository.dart';

class CartProductRepositoryImpl implements CartProductRepository {
  @override
  Future<List<Category>> getCategories() async {
    return [
      const Category(id: '1', name: 'All'),
      const Category(id: '2', name: 'Tshirts'),
      const Category(id: '3', name: 'Jeans'),
      const Category(id: '4', name: 'Shoes'),
    ];
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const Product(
        id: '1',
        name: 'Shoes',
        description: 'Comfortable blue running shoes',
        price: 1190,
        imageUrl: AppAssets.shoesBlue,
        size: 'L',
        categoryId: '4',
        rating: 4.5,
        numberOfReviews: 100,
        count: 1
      ),
      const Product(
        id: '2',
        name: 'Fit Polo T Shirt',
        description: 'Classic blue polo t-shirt',
        price: 1100,
        size: 'M',
        imageUrl: AppAssets.tshirtBlue,
        categoryId: '2',
        rating: 4.2,
        numberOfReviews: 50,
        count: 2
      ),
    ];
  }
}
