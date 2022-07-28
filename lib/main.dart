import 'package:coffee_app_ui/constants/theme.dart';
import 'package:coffee_app_ui/screen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee App UI',
        theme: AppTheme.appTheme,
        home: const MainScreen(),
        initialRoute: '/', // /home
        routes: {
          '/home': (context) => const MainScreen(),
        },
      ),
    );
  }
}
