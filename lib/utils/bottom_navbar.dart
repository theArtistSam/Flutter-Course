import 'package:flutter/material.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> screens = [
    HomeScreen(),
    DetailedScreen(name: "Some Name")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTap,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/chat-filled.svg',
                color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/person-filled.svg',
                color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: "Friends",
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset('assets/icons/settings-filled.svg'),
            //   label: "Settings",
            // ),
          ]),
    );
  }
}
