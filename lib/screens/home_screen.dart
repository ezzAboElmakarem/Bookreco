import 'package:bookreco/data/cubit/app_cubit.dart';
import 'package:bookreco/screens/bookmarkes_screen.dart';
import 'package:bookreco/screens/items.dart';
import 'package:bookreco/screens/login_Screen.dart';
import 'package:bookreco/screens/log_out.dart';
import 'package:bookreco/screens/social_club_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static String id = 'homepage';
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Items(),
    const bookmarks(),
    SocialClub(),
    const LogOut()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit c = AppCubit.get(context);
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.yellowAccent,
            unselectedItemColor: Colors.white,
            backgroundColor: const Color.fromARGB(200, 82, 30, 6),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.bookmarks_outlined), label: 'Bookmarks'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.groups_2), label: 'Social club'),
              BottomNavigationBarItem(
                icon: const Icon(Icons.logout_outlined),
                label: 'Log Out',
              ),
            ],
          ),
        );
      },
    );
  }
}
