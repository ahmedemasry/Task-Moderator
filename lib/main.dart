import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';
import 'utils/app_theme.dart';




void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
      ),

    );
  }


}
