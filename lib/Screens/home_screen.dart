import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_app/app_utils/image_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(

          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16,vertical: 0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Welcome'),
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
            // SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
          ],
        ),
      ),
    );
  }
}
