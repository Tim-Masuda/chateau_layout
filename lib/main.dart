import 'package:chateau_mobile_homescreen/screens/home_screen.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BaseTheme.dark(),
      darkTheme: BaseTheme.dark(),
      themeMode: ThemeMode.dark,
      title: "base",
      home: HomeScreen()
    );
  }
}
