import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNavBarCustomIcon extends StatelessWidget {
  const MyNavBarCustomIcon({
    super.key,
    required this.iconPath,
    // 💡 Change: Update the onTap type to accept the index
    required this.onTap,
    // 💡 New: Require the index for this button
    required this.index,
  });

  final String iconPath;
  // 💡 Change: The callback now accepts an integer (the index)
  final void Function(int index) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // 💡 Change: Call the onTap function and pass the stored 'index'
        onTap: () => onTap(index),
        splashColor: Colors.grey.withOpacity(0.5),
        child: SizedBox(
          width: 48.0,
          height: 48.0,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              height: 37,
              // If you need to color the icon based on selection state,
              // you would need to pass a boolean (isSelected) here as well.
            ),
          ),
        ),
      ),
    );
  }
}