import 'dart:async';

import 'package:authenticate/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())),
    );
  }
}
