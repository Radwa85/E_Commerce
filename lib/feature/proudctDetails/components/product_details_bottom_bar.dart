import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final double productPrice;
  final VoidCallback onAddToCartClick;

  const ProductDetailsBottomBar({
    super.key,
    required this.productPrice,
    required this.onAddToCartClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 24, right: 24),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide.none,
          vertical: BorderSide(color: AppColors.textSecondary),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.price,
                style: GoogleFonts.readexPro(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                "\$$productPrice",
                style: GoogleFonts.readexPro(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: onAddToCartClick,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 58),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.iconBag),
                  const SizedBox(width: 10),
                  Text(
                    AppStrings.addToCart,
                    style: GoogleFonts.readexPro(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
