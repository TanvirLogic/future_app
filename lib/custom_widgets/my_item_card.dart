// MyItemCard.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_utils/color_utils.dart';
import '../controllers/item_card_provider.dart';

class MyItemCard extends StatelessWidget { // 👈 Change to StatelessWidget
  const MyItemCard({
    super.key,
    required this.iconPath,
    required this.text,
    required this.index, // 👈 New: Pass the item's index
  });

  final String iconPath;
  final String text;
  final int index; // The index of this specific card

  @override
  Widget build(BuildContext context) {
    // 1. Listen to the provider for changes in the selected index
    final provider = context.watch<ItemCardProvider>();

    // 2. Determine if this card is the currently selected one
    final isSelected = provider.selectedIndex == index;

    // 3. Set the color based on selection state
    final cardColor = isSelected ? ColorUtils.navBarColor : ColorUtils.defaultCardColor; // Use a secondary color for unselected cards
    final textColor = isSelected ? Colors.white : Colors.black;
    final iconColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      // 4. Update the selected index on tap
      onTap: () => provider.setSelectedIndex(index),
      child: Card(
        margin: const EdgeInsets.only(right: 8.0), // Add margin for spacing
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorUtils.navBarColor, width: 1.0), // Example border
          ),
          height: 40,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                  color: iconColor, // Use dynamic color
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor, // Use dynamic color
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}