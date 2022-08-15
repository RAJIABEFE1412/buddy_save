import 'dart:async';
import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/States/onbaording_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buddy_save/utils/scroll_behaviour.dart';

class StateWrapper extends StatefulWidget {
  final Widget child;

  StateWrapper({
    required this.child,
    bool isMock = true,
  });

  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper>
    with WidgetsBindingObserver {
  late Timer inactiveTimer;

  GlobalKey<NavigatorState> _dignityFinanceNavKey =
      GlobalKey(debugLabel: "navGenerale");
  // BuddyTokenManager _tokenManager = BuddyTokenManager.instance;

  // final NavigationService _navigationService = locator<NavigationService>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // log('${_tokenManager.tokens.createdAt}');
        // if (_tokenManager.tokens.createdAt != null &&
        //     DateTime.now()
        //             .difference(_tokenManager.tokens.createdAt)
        //             .inMinutes >=
        //         6) {
        //   goToLogin();
        // }
        break;
      default:
        return;
    }
  }

  goToLogin() async {
    // return _navigationService.navigateTo(
    //   BuddyRoutes.login,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnBoardingState.instance,
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => ActionState.instance,
          lazy: true,
        ),
       
      ],
      child: ScrollConfiguration(
        behavior: BuddyScrollAttitude(),
        child: widget.child,
      ),
    );
  }
}
