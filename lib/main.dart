import 'package:coffee_app_ui/constants/theme.dart';
import 'package:coffee_app_ui/screen/mainScreen.dart';
import 'package:coffee_app_ui/widgets/testingDatabase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDFxokOYyRz_qwGAgLDvwAjZJppdY_wxMM",
        authDomain: "fir-menu-7e18d.firebaseapp.com",
        projectId: "fir-menu-7e18d",
        storageBucket: "fir-menu-7e18d.appspot.com",
        messagingSenderId: "111133089425",
        appId: "1:111133089425:web:c38b6da3ffb7d6abbde930",
        measurementId: "G-179Z4ZC1B3"),
  );

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
          '/t': (context) => const Testing(),
          '/home': (context) => const MainScreen(),
        },
      ),
    );
  }
}
