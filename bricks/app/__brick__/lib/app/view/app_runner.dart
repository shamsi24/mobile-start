import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:{{name.snakeCase()}}/app/cubit/app_cubit.dart';
import 'package:{{name.snakeCase()}}/app/view/app.dart';
import 'package:{{name.snakeCase()}}/presentation/ui/main/provider/main_provider.dart';

// The main entry point for the application, managing localization and global providers.
class AppRunner extends StatelessWidget {
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      // Enables saving of the chosen locale and sets the initial language to Azerbaijani (az).
      saveLocale: true,
      startLocale:
          const Locale('az'), // Sets Azerbaijani as the starting locale.
      path: "assets/translations", // Path to the translation files.
      supportedLocales: const [
        Locale("az"), // The supported locales, only Azerbaijani is enabled.
      ],
      fallbackLocale: const Locale(
          "az"), // Fallback to Azerbaijani if a locale is unsupported.

      // MultiProvider allows multiple providers to be available to the widget tree.
      child: MultiProvider(
        providers: [
          // BlocProvider to handle AppCubit, which manages the app state.
          BlocProvider(
            create: (_) => AppCubit(),
          ),
          // ChangeNotifierProvider to manage the MainProvider, which handles business logic for the main page.
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
        ],
        // The App widget, which contains the core structure of the application.
        child: const App(),
      ),
    );
  }
}
