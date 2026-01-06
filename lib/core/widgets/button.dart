import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool isOutlined;
  final IconData? icon;
  final bool iconAtEnd;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.isOutlined = false,
    this.icon,
    this.iconAtEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget childContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null && !iconAtEnd) ...[
          Icon(icon, color: isOutlined ? AppColors.textPrimary : AppColors.textLight),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: isOutlined ? AppColors.textPrimary : AppColors.textLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (icon != null && iconAtEnd) ...[
          const SizedBox(width: 8),
          Icon(icon, color: isOutlined ? AppColors.textPrimary : AppColors.textLight),
        ],
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isOutlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.buttonBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: childContent,
      )
          : TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: childContent,
      ),
    );
  }
}
