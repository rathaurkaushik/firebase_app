

import 'dart:async';

import 'package:authenticate/pages/auth/login_page.dart';
import 'package:authenticate/pages/firebase_realtime/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {

    final _auth = FirebaseAuth.instance;

    final user = _auth.currentUser;

    if(user != null){
      Timer(
        Duration(seconds: 4),
            () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())),
      );
    }

    else{
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }}
}
