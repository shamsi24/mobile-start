part of 'navigation.dart';

enum RouteName {
  login('login'),
  none('none');

  const RouteName(this.route);

  final String route;

  static RouteName? fromString(String? route) {
    return RouteName.values.firstWhere((element) => element.route == route);
  }
}
