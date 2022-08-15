import 'package:buddy_save/screens/add/amount.dart';
import 'package:buddy_save/screens/add/finalize.dart';
import 'package:buddy_save/screens/add/savings_duration.dart';
import 'package:buddy_save/screens/add/savings_type.dart';
import 'package:buddy_save/screens/add/title_info.dart';
import 'package:buddy_save/screens/auths/login.dart';
import 'package:buddy_save/screens/home/home.dart';
import 'package:buddy_save/screens/landing/onboard.dart';
import 'package:buddy_save/screens/landing/splash_screen.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, MaterialPageRoute, Route, RouteSettings;

class BuddyRoutes {
  static Widget home = const BuddySplash();

  /// Splash Routes
  static const splash = "/splash";

  /// Onboard Routes
  static const onboarding = "/onboarding";

  /// Dashboard

  static const homeScreen = "/HomeScreen";
  static const titleInfo = "/titleInfo";
  static const savingsType = "/savings/type";
  static const duration = "/savings/duration";
  static const finalize = "/savings/finalize";

  /// amount
  static const savingsAmount = "/savings/amount";
  static const login = "/login";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (BuildContext context) => const BuddySplash(),
    login: (BuildContext context) => const LoginPage(),
    homeScreen: (BuildContext context) => const HomeScreen(),
    onboarding: (BuildContext context) => const BuddyBoarding(),
    titleInfo: (BuildContext context) => BuddyTitleInfo(),
    savingsType: (BuildContext context) => BuddySavingsType(),
    savingsAmount: (BuildContext context) => BuddyAmount(),
    duration: (BuildContext context) => BuddySavingsDuration(),
    finalize: (BuildContext context) => BuddyFinalize(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const BuddySplash();
          },
        );
    }
  }
}
