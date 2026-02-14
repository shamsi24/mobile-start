import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Custom BlocObserver class to monitor lifecycle events of Blocs and Cubits.
class SimpleBlocObserver extends BlocObserver {
  // Called when a Bloc or Cubit is created.
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // Logs the creation of a Bloc or Cubit if in debug mode.
    if (kDebugMode) log('onCreate -- ${bloc.runtimeType}');
  }

  // Called when a Bloc or Cubit state changes.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Logs state changes of a Bloc or Cubit in debug mode.
    if (kDebugMode) log('onChange -- ${bloc.runtimeType}, $change');
  }

  // Called when a Bloc transitions from one state to another (only applies to Blocs, not Cubits).
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // Logs state transitions of a Bloc if in debug mode.
    if (kDebugMode) log('onTransition -- ${bloc.runtimeType}, $transition');
  }

  // Called when a Bloc or Cubit is closed.
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // Logs the closure of a Bloc or Cubit if in debug mode.
    if (kDebugMode) log('onClose -- ${bloc.runtimeType}');
  }
}
