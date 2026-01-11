import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../domain/entities/product.dart';

class CartProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onClickPlus;
  final VoidCallback onClickMinus;
  final int count;

  const CartProductCard({
    super.key,
    required this.product,
    required this.count,
    required this.onClickPlus,
    required this.onClickMinus,
  });

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Row(
        children: [
          Image.asset(
            widget.product.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: GoogleFonts.readexPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  "Size : ${widget.product.size}",
                  style: GoogleFonts.readexPro(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${widget.product.price}",
                      style: GoogleFonts.readexPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => widget.onClickMinus(),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: AppColors.buttonBorder),
                            ),
                            child: SvgPicture.asset(AppAssets.iconMinus),
                          ),
                        ),
                        const SizedBox(width: 9),
                        Text(
                          widget.count.toString(),
                          style: GoogleFonts.readexPro(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 9),
                        GestureDetector(
                          onTap: () => widget.onClickPlus(),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: AppColors.buttonBorder),
                            ),
                            child: SvgPicture.asset(AppAssets.iconPlus),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
