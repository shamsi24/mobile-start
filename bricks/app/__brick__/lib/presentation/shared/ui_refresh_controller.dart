import 'package:rxdart/rxdart.dart';

enum UIState {
  initial,
  refreshed,
}

class UIRefreshController {
  final _controllers = {
    'payments': BehaviorSubject<UIState>.seeded(UIState.initial),
    'main': BehaviorSubject<UIState>.seeded(UIState.initial),
    'home': BehaviorSubject<UIState>.seeded(UIState.initial),
    'properties': BehaviorSubject<UIState>.seeded(UIState.initial),
    'count': BehaviorSubject<UIState>.seeded(UIState.initial),
  };

  Stream<UIState> get paymentsControllerStream => _controllers['payments']?.stream ?? const Stream.empty();
  Stream<UIState> get mainControllerStream => _controllers['main']?.stream ?? const Stream.empty();
  Stream<UIState> get propertiesControllerStream => _controllers['properties']?.stream ?? const Stream.empty();
  Stream<UIState> get countControllerStream => _controllers['count']?.stream ?? const Stream.empty();
  Stream<UIState> get homeControllerStream => _controllers['home']?.stream ?? const Stream.empty();

  void refreshUi() {
    _controllers.forEach((key, controller) => controller.add(UIState.refreshed));
  }

  void refreshSpecificUi(String key) {
    if (_controllers.containsKey(key)) {
      _controllers[key]?.add(UIState.refreshed);
    }
  }

  void closeControllers() {
    _controllers.forEach((key, controller) => controller.close());
  }
}
