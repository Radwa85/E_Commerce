import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/button.dart';

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
        border: Border(top: BorderSide(color: AppColors.inputBorder, width: 1)),
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
          Expanded(
            child: AppButton(
              onPressed: onAddToCartClick,
              text: AppStrings.addToCart,
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppAssets.iconBag),
            ),
          ),
        ],
      ),
    );
  }
}
