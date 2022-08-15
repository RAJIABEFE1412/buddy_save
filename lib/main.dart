import 'package:buddy_save/screens/landing/splash_screen.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:buddy_save/values/state_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: BuddyColors.primary,
        ),
        routes: BuddyRoutes.staticRoutes,
        onGenerateRoute: BuddyRoutes.dynamicRoutes,
        initialRoute: BuddyRoutes.splash,
        // home: const BuddySplash(),
      ),
    );
  }
}
