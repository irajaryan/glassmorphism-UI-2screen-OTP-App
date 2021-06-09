import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Glassmorphism/Views/GMSignInPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var getMaterialApp = GetMaterialApp(
      title: "Flutter_App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: GMSignInPage(),
    );
    return getMaterialApp;
  }
}
