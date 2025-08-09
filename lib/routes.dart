import 'package:easy_pay/presentation/screens/control_panel/page/control_panel_page.dart';
import 'package:easy_pay/presentation/screens/recovery_pass/page/recovery_pass_page.dart';
import 'package:easy_pay/presentation/screens/sign_in/page/sign_in_page.dart';
import 'package:easy_pay/presentation/screens/sign_up/page/sign_up_page.dart';
import 'package:easy_pay/presentation/screens/welcome/page/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final rootNavgatorKey = GlobalKey<NavigatorState>();

class RoutersName {
  static const String welcome = 'welcome';
  static const String signIn = 'sign_in';
  static const String signUp = 'sign_up';
  static const String controlPanel = 'control_panel';
  static const String forgotPass = 'forgot_pass';
}

final router = GoRouter(
  initialLocation: '/${RoutersName.welcome}',
  navigatorKey: rootNavgatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/${RoutersName.welcome}',
      name: RoutersName.welcome,
      pageBuilder: (context, state) => NoTransitionPage(child: WelcomePage()),
    ),
    GoRoute(
      path: '/${RoutersName.signIn}',
      name: RoutersName.signIn,
      pageBuilder: (context, state) => NoTransitionPage(child: SignInPage()),
    ),
    GoRoute(
      path: '/${RoutersName.signUp}',
      name: RoutersName.signUp,
      pageBuilder: (context, state) => NoTransitionPage(child: SignUpPage()),
    ),
    GoRoute(
      path: '/${RoutersName.controlPanel}',
      name: RoutersName.controlPanel,
      pageBuilder: (context, state) =>
          NoTransitionPage(child: ControlPanelPage()),
    ),
    GoRoute(
      path: '/${RoutersName.forgotPass}',
      name: RoutersName.forgotPass,
      pageBuilder: (context, state) =>
          NoTransitionPage(child: RecoveryPassPage()),
    ),
  ],
);
