import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final rootNavgatorKey = GlobalKey<NavigatorState>();

class RoutersName {}

final router = GoRouter(
  initialLocation: '',
  navigatorKey: rootNavgatorKey,
  debugLogDiagnostics: true,
  routes: [],
);
