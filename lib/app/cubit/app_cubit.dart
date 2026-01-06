import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging_service/storage/debug_tool.dart';
import 'package:shamsi_mobile_template/app/cubit/app_state.dart';
import 'package:shamsi_mobile_template/app/generic/generic_state.dart';
import 'package:shamsi_mobile_template/data/service/preferences/preferences.dart';
import 'package:shamsi_mobile_template/presentation/router/navigation.dart';

class AppCubit extends Cubit<GenericState> {
  // Constructor initializes the cubit state and triggers the 'check' and '_startDebugTool' methods.
  AppCubit() : super(Initial()) {
    check();
    _startDebugTool();
  }

  // Variable to track if a dialog is currently open.
  bool _isDialogOpen = false;
  bool get isDialogOpen => _isDialogOpen;

  // A list of widget pages that may be used in the app.
  static final List<Widget> _pages = [];

  // Toggles the state of whether a dialog is open or not.
  void toggleDialog(bool isOpen) {
    _isDialogOpen = isOpen;
  }

  // Starts the debug tool for tracking logs or debugging info.
  void _startDebugTool() {
    DebugTool().start(Navigation.context, "");
  }

  // Getter for accessing the list of pages.
  List<Widget> get pages => _pages;

  // Checks the initial app state, performs device and authorization checks, and emits corresponding states.
  Future<void> check() async {
    // Display the splash screen during the initial check.
    emit(SplashScreen());
    try {
      // Retrieve device information.
      final prefs = await PreferencesService.instance;

      // If the user has not passed the authorization phase, emit Unauthorized state.
      if (!prefs.wasAuthorizationPassed) {
        emit(Unauthorized());
        return;
      }

      // If the user has passed the pin screen, initialize the session and emit the Authorized state.
      if (prefs.wasPinPassed) {
        await _initializeUserSession(prefs);
        emit(Authorized());
      } else {
        // If the pin screen has not been passed, show the pin screen state.
        emit(Pin());
      }
    } on HttpException {
      // Handle any authorization errors by clearing preferences and emitting Unauthorized state.
      await _handleAuthorizationError();
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing app: $e');
      }
    }
  }

  // Initializes the user session by disabling the pin screen.
  Future<void> _initializeUserSession(PreferencesService prefs) async {
    await prefs.askPin(false);
  }

  // Handles errors during authorization by clearing preferences and redirecting to the Unauthorized state.
  Future<void> _handleAuthorizationError() async {
    final prefs = await PreferencesService.instance;
    await prefs.clear();
    emit(Unauthorized());
  }
}
