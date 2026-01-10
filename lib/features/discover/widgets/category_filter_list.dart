import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/domain/entities/category.dart';
import 'package:flutter/material.dart';

class CategoryFilterList extends StatelessWidget {
  final List<Category> categories;
  final Function(String) onCategorySelected;
  final String selectedCategoryId;

  const CategoryFilterList({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category.id == selectedCategoryId;
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => onCategorySelected(category.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : const Color(0xFFF2F2F2),
                  ),
                ),
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
