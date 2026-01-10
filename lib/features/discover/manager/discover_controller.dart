import 'package:e_commerce/data/repositories/product_repository_impl.dart';
import 'package:e_commerce/domain/entities/category.dart';
import 'package:e_commerce/domain/entities/product.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class DiscoverController extends ChangeNotifier {
  final ProductRepository _repository;

  DiscoverController({ProductRepository? repository})
      : _repository = repository ?? ProductRepositoryImpl();

  List<Category> _categories = [];
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _selectedCategoryId = '1';

  List<Category> get categories => _categories;
  List<Product> get products => _filteredProducts;
  bool get isLoading => _isLoading;
  String get selectedCategoryId => _selectedCategoryId;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final categoriesData = await _repository.getCategories();
      final productsData = await _repository.getProducts();

      _categories = categoriesData;
      _allProducts = productsData;
      _applyFilters();
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String categoryId) {
    if (_selectedCategoryId == categoryId) return;
    
    _selectedCategoryId = categoryId;
    
    _categories = _categories.map((cat) {
      return cat.copyWith(isSelected: cat.id == categoryId);
    }).toList();
    
    _applyFilters();
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredProducts = _allProducts.where((product) {
      final matchesCategory = _selectedCategoryId == '1' ||
          product.categoryId == _selectedCategoryId;
      
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      
      return matchesCategory && matchesSearch;
    }).toList();
  }
}
