import 'package:e_commerce/features/address/address_screen.dart';
import 'package:flutter/material.dart';

import 'discover/pages/discover_screen.dart';
import 'discover/widgets/bottom_nav_bar.dart';
import 'myCart/my_cart_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final pages = [
    DiscoverScreen(),
    MyCartScreen(),
    AddressScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
