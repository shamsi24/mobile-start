import 'package:shamsi_mobile_template/app/generic/generic_state.dart';
import 'package:shamsi_mobile_template/presentation/router/navigation.dart';

// This file defines different application states that extend from the GenericState class.
// These states are used to manage the navigation and flow of the app, based on the user's status or app conditions.

class Authorized extends GenericState {
  // This state is emitted when the user has successfully passed authorization (e.g., logged in).
  // It indicates that the app should now navigate to the main screen or dashboard.
}

class Unauthorized extends GenericState {
  // This state is emitted when the user has not passed authorization or the session has expired.
  // It prompts the app to show the login screen or onboarding flow.
}

class SplashScreen extends GenericState {
  // This state is emitted when the app is in the loading or initializing phase, typically shown as a splash screen.
  // It can be used when checking user session data, loading resources, or other initial tasks.
}

class Pin extends GenericState {
  // This state is emitted when the app requires the user to enter a PIN code for additional security.
  // It is often used to lock sensitive sections of the app, even if the user is already logged in.
}

class NavigateToPage extends GenericState {
  // This state is used to navigate to a specific page within the app.
  // It contains a route (defined by RouteName) to indicate the target screen.

  final RouteName
      route; // Holds the destination route that the app should navigate to.

  NavigateToPage(
      this.route); // Constructor that takes the route as a parameter.

  @override
  List<Object?> get props => [route];
// Overriding props to include the route in the comparison logic.
// This is essential for efficient state comparison, particularly in Bloc when tracking state changes.
}
