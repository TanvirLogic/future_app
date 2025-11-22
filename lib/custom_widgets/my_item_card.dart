import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_utils/color_utils.dart';
class MyItemCard extends StatelessWidget {
  const MyItemCard({super.key, required this.iconPath, required this.text});

  final String iconPath;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                iconPath,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              Text(
                text,
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
    );
  }
}