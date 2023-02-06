import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grootanapps/firebase_options.dart';
import 'package:grootanapps/views/splash.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'resuables/size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
        builder: (context, child) {
          MySize().init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light
                    .copyWith(statusBarColor: Colors.transparent),
                child: SafeArea(
                  child: child ?? Container(),
                ),
              ),
            ),
          );
        },
        title: 'Grootan App',
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
