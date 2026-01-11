import 'package:e_commerce/features/address/components/default_address_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isDefault;

  const AddressCard({
    super.key,
    required this.title,
    required this.description,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 39, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.iconLocation, height: 24, width: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.readexPro(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    if (isDefault) ...[
                      const SizedBox(width: 2),
                      const DefaultAddressChip(),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.readexPro(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
