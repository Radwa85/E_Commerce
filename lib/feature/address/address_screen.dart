import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/domain/repository/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_strings.dart';
import '../../core/widgets/app_bar.dart';
import '../../domain/entity/address.dart';
import 'components/address_card.dart';

class AddressScreen extends StatefulWidget {
  final AddressRepository addressRepository;

  const AddressScreen({super.key, required this.addressRepository});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late List<Address> addresses;

  @override
  void initState() {
    super.initState();
    addresses = widget.addressRepository.fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.address),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
                child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: AddressCard(
                      title: address.title,
                      description: address.description,
                      isDefault: address.isDefault,
                    ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
