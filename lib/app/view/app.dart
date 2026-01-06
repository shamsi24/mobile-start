import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsi_mobile_template/app/cubit/app_cubit.dart';
import 'package:shamsi_mobile_template/app/cubit/app_state.dart';
import 'package:shamsi_mobile_template/app/generic/generic_consumer.dart';
import 'package:shamsi_mobile_template/app/generic/generic_state.dart';
import 'package:shamsi_mobile_template/presentation/router/navigation.dart';
import 'package:shamsi_mobile_template/presentation/router/route_generator.dart';
import 'package:shamsi_mobile_template/presentation/shared/shared.dart';
import 'package:shamsi_mobile_template/presentation/ui/main/view/main_page.dart';

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
            // App title and theme configuration.
            title: "E-Bina",
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
            home: GenericConsumer<AppCubit, GenericState>(
              // Listens to the state changes and updates the UI accordingly.
              builder: (context, state) => _buildPage(state),
              listener: (context, state) {
                // Handles failure state and prints error details in debug mode.
                if (state is Failure && kDebugMode) {
                  print(state.error);
                }
              },
            ),
          );
        },
      ),
    );
  }

  // Determines which page to display based on the current application state.
  Widget _buildPage(GenericState state) {
    switch (state.runtimeType) {
      case const (Authorized):
        // If the user is authorized, show the main page.
        return const MainPage();
      case const (Pin):
      // If a PIN is required for confirmation, show the passcode page.
      // return const PasscodePage(passCodeState: PassCodeState.confirm);
      case const (NavigateToPage):
      // When navigating via a push notification, show the notifications page.
      // return const NotificationsPage();
      case const (Unauthorized):
        // If the user is unauthorized, show nothing (empty widget).
        return const SizedBox.shrink();
      case const (SplashScreen):
      default:
        // Default case or when loading, show the splash screen.
        // return const SplashPage();
        return const SizedBox.shrink();
    }
  }
}
