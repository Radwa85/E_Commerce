import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/data/repositories/cart_product_repository_impl.dart';
import 'package:e_commerce/features/myCart/my_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/button.dart';
import 'components/cart_product_card.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late final MyCartController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MyCartController(repository: CartProductRepositoryImpl());
    _controller.loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.myCart, showBackButton: false),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (_controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Expanded(
                child: ListView.builder(
                  itemCount: _controller.products.length,
                  itemBuilder: (context, index) {
                    final product = _controller.products[index];
                    return Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 14),
                      child: CartProductCard(
                        product: product,
                        count: 1,
                        onClickPlus: () => _controller.incrementCount(index),
                        onClickMinus: () => _controller.decrementCount(index),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 20),
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 24),
              cartDetail(AppStrings.subTotal, _controller.subTotal.toString()),
              SizedBox(height: 16),
              cartDetail(AppStrings.vat, _controller.vat.toString()),
              SizedBox(height: 16),
              cartDetail(
                AppStrings.shippingFee,
                _controller.shippingFee.toString(),
              ),

              SizedBox(height: 16),
              Divider(color: AppColors.inputBorder),
              SizedBox(height: 16),
              cartDetail(AppStrings.total, _controller.total.toString()),
              SizedBox(height: 16),
              AppButton(
                onPressed: () => {},
                text: AppStrings.goToCheckout,
                backgroundColor: AppColors.primary,
                iconAtEnd: true,
                icon: SvgPicture.asset(AppAssets.iconArrowRight),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cartDetail(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.readexPro(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          "\$ $value",
          style: GoogleFonts.readexPro(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.4,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
