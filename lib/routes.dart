import 'package:easy_pay/presentation/screens/sign_in/page/sign_in_page.dart';
import 'package:easy_pay/presentation/screens/welcome/page/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final rootNavgatorKey = GlobalKey<NavigatorState>();

class RoutersName {
  static const String welcome = 'welcome';
  static const String signIn = 'sign_in';
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
  ],
);
