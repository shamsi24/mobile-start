import 'package:flutter/material.dart';

part 'route_name.dart';

class Navigation {
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState!.context;

  static Future<Object?>? push(RouteName routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushNamed(
      routeName.route,
      arguments: arguments,
    );
  }

  static Future<Object?>? pushReplacement(RouteName routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushReplacementNamed(
      routeName.route,
      arguments: arguments,
    );
  }

  static Future<Object?>? pushNamedAndRemoveUntil(RouteName routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName.route,
      (route) => route.isFirst,
      arguments: arguments,
    );
  }

  static Future<dynamic> popToRootAndPushNamed(RouteName routeName,
      {dynamic arguments}) async {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
    return await pushReplacement(routeName, arguments: arguments);
  }

  static void popUntil(RouteName routeName) {
    return navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(routeName.route));
  }

  static Future<dynamic> pushAndRemoveUntil(
    RouteName newRouteName, {
    required RouteName removeUntil,
    dynamic arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      newRouteName.route,
      (route) => route.settings.name == removeUntil.route,
      arguments: arguments,
    );
  }

  static void pop<T>({T? result}) {
    return navigatorKey.currentState?.pop(result);
  }

  static void popToRoot<T>({T? result}) {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;
}
