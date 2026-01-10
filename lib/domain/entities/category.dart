class Category {
  final String id;
  final String name;
  final bool isSelected;

  const Category({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  Category copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
