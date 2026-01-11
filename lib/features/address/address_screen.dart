import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/domain/repositories/address_repository.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/address.dart';
import 'components/address_card.dart';
import 'components/address_screen_app_bar.dart';

class AddressScreen extends StatefulWidget {
  final AddressRepository addressRepository;

  const AddressScreen({super.key, required this.addressRepository});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late List<Address> addresses;
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    addresses = await widget.addressRepository.fetchAddresses();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddressScreenAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: AppColors.background,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
