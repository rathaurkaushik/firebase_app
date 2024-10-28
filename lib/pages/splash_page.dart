

import 'package:authenticate/firebase_services/splash_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  SplashServices splashpage = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashpage.isLogin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Splash Page'),),
    );
  }
}
