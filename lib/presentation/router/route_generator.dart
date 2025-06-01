import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rht_mobile_template/presentation/components/appbar/primary_app_bar.dart';
import 'package:rht_mobile_template/presentation/router/navigation.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

class RouteGenerator {
  RouteGenerator._();

  static String currentRoute = "";

  static clearRoute() {
    currentRoute = "";
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = RouteName.fromString(settings.name);
    final args = settings.arguments;

    currentRoute = settings.name ?? "";

    if (kDebugMode) {
      print("Navigating to :> [$route] ; Arguments are :> [$args]");
    }

    switch (route) {
      //TODO: Example

      // case RouteName.login:
      //   final isExpired = args as bool;
      //   return _push(LoginPage(isLogin: isExpired));

      case RouteName.none:
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static PageRoute _push(Widget widget) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, animation, secondaryAnimation, child) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
          );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: PrimaryAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.time, size: 30),
              8.vertical,
              const Center(
                child: Label(
                  size: 18,
                  text: "Coming Soon",
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
