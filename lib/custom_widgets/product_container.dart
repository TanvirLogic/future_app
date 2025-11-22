import 'package:flutter/material.dart';

import '../app_utils/image_utils.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // The container height is constrained to 175.4 pixels by the GridView.
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Image section: Takes remaining space (correct)
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                ImageUtils.firstProductImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Product Details section: Fixed content (Minimized space)
          Padding(
            // **CRITICAL CHANGE:** Vertical padding reduced from 6 to 2 (Saves 8px total)
            padding: const EdgeInsets.symmetric(
              horizontal: 17.0,
              vertical: 2, // <-- Aggressive reduction in padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Modern Light Clothes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 1), // <-- Reduced vertical gap
                Text('T-Shirt'),
                const SizedBox(height: 2), // <-- Reduced vertical gap
                SizedBox(
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1000/- ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text('4.5'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border, size: 20),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
