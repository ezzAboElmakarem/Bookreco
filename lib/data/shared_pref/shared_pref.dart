import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  saveData({required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    print(email);
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('email');
  }
}
