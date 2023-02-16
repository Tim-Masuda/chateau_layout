import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/screens/home_screen.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scale(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: BaseTheme.dark(),
          darkTheme: BaseTheme.dark(),
          themeMode: ThemeMode.dark,
          title: "base",
          home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarIconBrightness: Brightness.dark,
              ),
            child: Builder(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: context.sc,
                ),
                child:const HomeScreen(),
              ),
            ),
          ),
        ),
      );
}
