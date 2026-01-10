import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_dimensions.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: Colors.white,
        border: BoxBorder.fromBorderSide(    BorderSide(
          color: AppColors.inputBorder,
          width: 1,
        ),)

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(0, AppStrings.home, AppAssets.iconHome),
          _buildNavItem(1, AppStrings.cart, AppAssets.iconCart),
          _buildNavItem(2, AppStrings.account, AppAssets.iconAccount),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    final isSelected = currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: AppDimensions.iconM,
              height: AppDimensions.iconM,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.textInput,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXS),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textInput,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
