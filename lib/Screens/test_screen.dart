import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rounded Navigation Bar'),
        ),
        body: const Center(
          child: Text('Content of the current page'),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.blue, // Background color of the navigation bar
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), // Adjust radius as needed
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect( // Clip children to the rounded shape
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent, // Make it transparent to show the container's color
              elevation: 0, // Remove default elevation
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: 0, // Set initial selected index
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              onTap: (index) {
                // Handle navigation to different pages based on index
                print('Tapped on index $index');
              },
            ),
          ),
        ),
      ),
    );
  }
}