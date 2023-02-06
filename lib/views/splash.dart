import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grootanapps/views/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;
  @override
  void initState() {
    super.initState();
    navigation();
  }

  navigation() {
    Timer(
      const Duration(seconds: 5),
      () => Get.to(const LoginFields()),
    );
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/splash.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
