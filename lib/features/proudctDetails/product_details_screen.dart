import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_bar.dart';
import '../../domain/entities/product.dart';
import 'components/product_details_bottom_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Details'),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              widget.product.imageUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text(
              widget.product.name,
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 13),
            Row(
              children: [
                SvgPicture.asset(AppAssets.iconStar),
                SizedBox(width: 6),
                Text(
                  "${widget.product.rating}/5",
                  style: GoogleFonts.readexPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: AppColors.textPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  "(${widget.product.numberOfReviews} reviews)",
                  style: GoogleFonts.readexPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 13),
            Text(
              widget.product.description,
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProductDetailsBottomBar(
        productPrice: widget.product.price,
        onAddToCartClick: () => {
          // TODO Handle add to cart
        },
      ),
    );
  }
}
