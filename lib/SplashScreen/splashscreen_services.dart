import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:kalyan_education_video_app/Auth/login_screen.dart';
import 'package:kalyan_education_video_app/Courses/Allcourses.dart';
import 'package:kalyan_education_video_app/Home/mainpage.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllCoursesScreen(),
            )),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )),
      );
    }
  }
}
