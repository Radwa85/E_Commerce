import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class DefaultAddressChip extends StatelessWidget {
  const DefaultAddressChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.inputBorder,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        AppStrings.defaultLabel,
        style: GoogleFonts.readexPro(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 1.4,
        ),
      ),
    );
  }
}
