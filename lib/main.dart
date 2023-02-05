import 'package:chateau_mobile_homescreen/screens/home_screen.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // подстановка размера с дизайном****

      designSize: const Size(360, 740),
      // размер экран****

      splitScreenMode: true,
      // минимал адаптация текста***

      minTextAdapt: true,
      builder: (BuildContext context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            // statusBarColor: BaseColors.secondary,
            // systemNavigationBarColor: BaseColors.secondary,
            statusBarIconBrightness: Brightness.dark
          ),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: BaseTheme.dark(),
              darkTheme: BaseTheme.dark(),
              themeMode: ThemeMode.dark,
              title: "base",
              home: HomeScreen()),
        );
      },
    );
  }
}
