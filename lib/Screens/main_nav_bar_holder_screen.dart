import 'package:flutter/material.dart';
import 'package:future_app/Screens/cart_screen.dart';
import 'package:future_app/Screens/favourite_screen.dart';
import 'package:future_app/Screens/home_screen.dart';
import 'package:future_app/Screens/profile_screen.dart';
import 'package:future_app/app_utils/app_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_utils/image_utils.dart';
import '../custom_widgets/my_nav_bar_custom_icon.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  // List of icon paths corresponding to the screens
  final List<String> _iconPaths = [
    ImageUtils.homeNavIcon, // Index 0
    ImageUtils.cartIcon, // Index 1
    ImageUtils.favouriteIcon, // Index 2
    ImageUtils.profileIcon, // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppUtils.backGroundColor,
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppUtils.navBarColor,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // 💡 Refactored: Call the dedicated method to build the children list
                children: _buildNavBarItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 1. Dedicated Method to Build Navigation Bar Items
  List<Widget> _buildNavBarItems() {
    return List.generate(_iconPaths.length, (index) {
      final bool isSelected = index == _selectedIndex;

      return Column(
        children: [
          const SizedBox(height: 10),
          // Your custom icon widget, passing the necessary index and callback
          MyNavBarCustomIcon(
            iconPath: _iconPaths[index],
            index: index,
            onTap: _onTapNavBarIconButton,
          ),
          // Conditionally show the selection dot
          if (isSelected) SvgPicture.asset(ImageUtils.homeNavIconDot),
          if (!isSelected)
            // Use a spacer to keep vertical alignment consistent (height 5, matching the dot size)
            const SizedBox(height: 5, width: 24),
        ],
      );
    });
  }

  // 2. Updated onTap function to accept the index and change the state
  void _onTapNavBarIconButton(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
