import 'package:bookreco/screens/bookmarkes_screen.dart';
import 'package:bookreco/screens/items.dart';
import 'package:bookreco/screens/search_screen.dart';
import 'package:bookreco/screens/social_club_screen.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static String id = 'homepage';
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex = 0;
  List<Widget> screens = [Items(), bookmarks(), SocialClub(), Search()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(200, 82, 30, 6),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined), label: 'Bookmarks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_2), label: 'Social club'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Seach'),
        ],
      ),
    );
  }
}
