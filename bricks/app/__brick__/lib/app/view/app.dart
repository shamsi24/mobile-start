import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrader/upgrader.dart';
import 'package:{{name.snakeCase()}}/app/cubit/app_cubit.dart';
import 'package:{{name.snakeCase()}}/app/cubit/app_state.dart';
import 'package:{{name.snakeCase()}}/app/generic/generic_consumer.dart';
import 'package:{{name.snakeCase()}}/app/generic/generic_state.dart';
import 'package:{{name.snakeCase()}}/presentation/router/navigation.dart';
import 'package:{{name.snakeCase()}}/presentation/router/route_generator.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/shared.dart';
import 'package:{{name.snakeCase()}}/presentation/ui/splash_page/splash_pagepgrader/upgrader.dart';

// The main application widget, which is stateless and manages the initial setup.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // Copies the current media query and adjusts text scaling to be linear.
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        // Initializes ScreenUtil for responsive design with a base size of 360x690.
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [Navigation.routeObserver],
            // App title and theme configuration.
            title: "SHAMSI MOBILE TEMPLATE",
            theme: UITheme.appTheme,
            navigatorKey:
                Navigation.navigatorKey, // Navigation control via a global key.
            locale: context.locale, // Locale configuration for localization.
            supportedLocales:
                context.supportedLocales, // Supported languages for the app.
            localizationsDelegates:
                context.localizationDelegates, // Localization delegate.
            onGenerateRoute:
                RouteGenerator.generateRoute, // Handles route generation.
            home: UpgradeAlert(
              showIgnore: false,
              showLater: false,
              child: GenericConsumer<AppCubit, GenericState>(
                // Listens to the state changes and updates the UI accordingly.
                builder: (context, state) => _buildPage(state),
                listener: (context, state) {
                  // Handles failure state and prints error details in debug mode.
                  if (state is Failure && kDebugMode) {
                    debugPrint(state.error.toString());
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Determines which page to display based on the current application state.
  Widget _buildPage(GenericState state) {
    // Handle state transitions specifically for Authorized state
    if (state is Authorized) {
      // return const HomePage();
    }

    // Handle the rest of the states
    switch (state.runtimeType) {
      case const (Pin):
      // If a PIN is required for confirmation, show the passcode page.
      // return const PasscodePage(passCodeState: PassCodeState.confirm);
      case const (NavigateToPage):
      // if (state is Unauthorized) {
      //   return const OnBoardingPage();
      // } else if (state is Pin) {
      //   return const PasscodePage(passCodeState: PassCodeState.confirm);
      // }
      case const (Unauthorized):
      // If the user is unauthorized, show onboarding page
      // return const OnBoardingPage();
      case const (SplashScreen):
      // Return the actual splash page when in splash screen state
      // return const SplashPage();
      default:
        // If state is not recognized, show splash screen
        return const SplashPage();
    }
  }
}
