import 'package:flutter/material.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/app_resources/app_routes_names.dart';
import 'package:todo/screens/home/tabs/home_tab/home_tab.dart';
import 'package:todo/screens/home/tabs/love_tab.dart';
import 'package:todo/screens/home/tabs/map_tab.dart';
import 'package:todo/screens/home/tabs/profile_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: const Text('Home')),
        //backgroundColor: AppColors.primaryColor,
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: 'Love'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutesNames.createEvent);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

List<Widget> tabs = [
  const HomeTab(),
  const MapTab(),
  const LoveTab(),
  const ProfileTab()
];
