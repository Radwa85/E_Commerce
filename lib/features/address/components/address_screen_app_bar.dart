import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/app_bar.dart';

class AddressScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddressScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: AppStrings.address),
          const Divider(color: AppColors.inputBorder),
          const SizedBox(height: 20),
          Text(
            AppStrings.savedAddress,
            style: GoogleFonts.readexPro(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 72);
}
