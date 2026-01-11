import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/domain/entities/category.dart';
import 'package:e_commerce/domain/entities/product.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository {
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
        categoryId: '4',
        rating: 4.5,
        numberOfReviews: 100,
      ),
      const Product(
        id: '2',
        name: 'Fit Polo T Shirt',
        description: 'Classic blue polo t-shirt',
        price: 1100,
        imageUrl: AppAssets.tshirtBlue,
        categoryId: '2',
        rating: 4.2,
        numberOfReviews: 50,
      ),
      const Product(
        id: '3',
        name: 'Regular Fit Black',
        description: 'Standard fit blue t-shirt',
        price: 1690,
        imageUrl: AppAssets.tshirtBlue, // Reusing asset as placeholder for now
        categoryId: '2',
        rating: 4.8,
        numberOfReviews: 200,
      ),
      const Product(
        id: '4',
        name: 'Regular Fit V-Neck',
        description: 'V-neck style shoe', // Description matches title/image logic mismatch in screenshot
        price: 1290,
        imageUrl: AppAssets.shoesBlue, // Reusing asset
        categoryId: '4',
        rating: 4.3,
        numberOfReviews: 80,
      ),
       const Product(
        id: '5',
        name: 'Dark Blue T-Shirt',
        description: 'Dark blue specialized t-shirt',
        price: 1350,
        imageUrl: AppAssets.tshirtBlue,
        categoryId: '2',
         rating: 4.3,
         numberOfReviews: 80,
      ),
    ];
  }
}
