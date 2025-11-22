import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_utils/color_utils.dart';

class MyItemCard extends StatefulWidget {
  const MyItemCard({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  final void Function() onTap;
  final String iconPath;
  final String text;

  @override
  State<MyItemCard> createState() => _MyItemCardState();
}

class _MyItemCardState extends State<MyItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: ColorUtils.navBarColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 40,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
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
