import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_dimensions.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/button.dart';
import 'package:e_commerce/core/widgets/text_field.dart';
import 'package:e_commerce/features/discover/pages/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      Text(
                        AppStrings.loginTitle,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingS),

                      Text(
                        AppStrings.loginSubtitle,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: AppDimensions.paddingXL),

                      const AppTextField(
                        label: AppStrings.userName,
                        hint: AppStrings.enterFullName,
                      ),
                      const SizedBox(height: AppDimensions.spacingL),

                      AppTextField(
                        label: AppStrings.password,
                        hint: AppStrings.enterPassword,
                        isPassword: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SvgPicture.asset(
                            AppAssets.iconVisibilityOff,
                          ),
                        ),

                      ),

                      const SizedBox(height: AppDimensions.paddingXL),

                      AppButton(
                        text: AppStrings.signIn,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DiscoverScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "${AppStrings.dontHaveAccount} ",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        AppStrings.join,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}