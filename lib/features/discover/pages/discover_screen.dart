import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_dimensions.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/features/discover/manager/discover_controller.dart';
import 'package:e_commerce/features/discover/widgets/bottom_nav_bar.dart';
import 'package:e_commerce/features/discover/widgets/category_filter_list.dart';
import 'package:e_commerce/features/discover/widgets/custom_search_bar.dart';
import 'package:e_commerce/features/discover/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final DiscoverController _controller = DiscoverController();
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (_controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppDimensions.spacingXL),
                        Text(
                          AppStrings.discover,
                          style: GoogleFonts.readexPro(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacingL),
                        
                        Row(
                          children: [
                            Expanded(
                              child: CustomSearchBar(
                                onSearch: _controller.searchProducts,
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spacingM),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                              ),
                              padding: const EdgeInsets.all(AppDimensions.spacingM),
                              child: SvgPicture.asset(
                                AppAssets.iconFilter,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.paddingL),
                        
                        CategoryFilterList(
                          categories: _controller.categories,
                          onCategorySelected: _controller.selectCategory,
                        ),
                        const SizedBox(height: AppDimensions.paddingL),
                        
                        Expanded(
                          child: GridView.builder(
                            itemCount: _controller.products.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.72,
                              crossAxisSpacing: AppDimensions.spacingL,
                              mainAxisSpacing: AppDimensions.spacingL,
                            ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: _controller.products[index],
                                onTap: () {
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsScreen(
                                        product: _controller.products[index],
                                      ),
                                    ),
                                  );*/
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomNavBar(
                  currentIndex: _currentNavIndex,
                  onTap: (index) {
                    setState(() {
                      _currentNavIndex = index;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
