import 'package:flutter/material.dart';

import '../app_utils/color_utils.dart';

class ItemCardProvider extends ChangeNotifier {
  // Track the index of the currently selected card.
  int _selectedIndex = 0; // Default to the first item (index 0)

  int get selectedIndex => _selectedIndex;

  // Method to set the selected index and notify listeners
  void setSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  // Helper method to get the correct color for a given index
  Color getColor(int index) {
    return index == _selectedIndex
        ? ColorUtils.navBarColor // Highlighted/Selected color
        : Colors.white; // Default color
  }
}