import 'dart:async';

import 'package:first_flutter_app/app/home/HomeState.dart';
import 'package:first_flutter_app/app/home/HomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    timeoutToMainScreen(context);

    return Scaffold(
      body: Center(
        child: Image.asset("images/logo.png", width: 52.0, height: 52.0),
      ),
    );
  }

  void timeoutToMainScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2), () => startMainScreen(context));
  }

  startMainScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeWidget()),
    );
  }
}
