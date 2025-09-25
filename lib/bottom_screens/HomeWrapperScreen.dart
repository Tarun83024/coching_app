import 'package:coching_app/bottom_screens/My_Plan.dart';
import 'package:coching_app/bottom_screens/home_screens.dart';
import 'package:coching_app/bottom_screens/library_screen.dart';
import 'package:coching_app/bottom_screens/search_screen.dart';
import 'package:coching_app/setting_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeWrapperScreen extends StatefulWidget {
  const HomeWrapperScreen({super.key});

  @override
  State<HomeWrapperScreen> createState() => _HomeWrapperScreenState();
}

class _HomeWrapperScreenState extends State<HomeWrapperScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const MyPlan(),
    const SearchScreen(),
    const LibraryScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        // height: 60,
        style: TabStyle.reactCircle, // or TabStyle.fixedCircle
        backgroundColor: Colors.blue.shade300,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.menu_book, title: 'My Plan'),
          TabItem(icon: Icons.search_rounded, title: 'Search'),
          TabItem(icon: Icons.download, title: 'Library'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
