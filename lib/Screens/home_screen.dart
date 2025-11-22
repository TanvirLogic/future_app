import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_app/app_utils/image_utils.dart';
import 'package:future_app/controllers/item_card_provider.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/my_item_card.dart';
import 'item_screens/all_item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _imagePaths = [
    ImageUtils.allCategoryIcon,
    ImageUtils.dressIcon,
    ImageUtils.shirtIcon,
    ImageUtils.jeansIcon,
  ];
  final List<String> _imageTexts = ['All Items', 'Dresses', 'Shirts', 'Jeans'];
  final int _selectedScreenIndex   = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 25),
            // Welcome Widgets
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Welcome 👋'),
                      Text(
                        'Albert Stevano',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 180),
                  CircleAvatar(),
                ],
              ),
            ),
            // Search Box Widgets
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hint: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            Text(
                              'Search Products',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  SvgPicture.asset(ImageUtils.filterIcon),
                ],
              ),
            ),
            // Item Widgets
            ChangeNotifierProvider(
              create: (_) => ItemCardProvider(), // 👈 Provider is here, only one instance created
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _imagePaths.length,
                            // No need for Consumer here, MyItemCard uses context.watch
                            itemBuilder: (context, index) {
                              return MyItemCard(
                                // We removed onTap from MyItemCard, its logic is now inside
                                iconPath: _imagePaths[index],
                                text: _imageTexts[index],
                                index: index,
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            AllItemScreen(),
          ],
        ),
      ),
    );
  }
}


