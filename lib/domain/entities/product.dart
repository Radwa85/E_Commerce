class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String size;
  final String imageUrl;
  final String categoryId;
  final int numberOfReviews;
  final int count;


  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.size,
    required this.imageUrl,
    required this.categoryId,
    required this.rating,
    required this.numberOfReviews,
    this.count = 0,
  });
}
