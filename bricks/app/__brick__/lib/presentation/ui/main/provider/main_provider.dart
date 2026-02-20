import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app/view/di.dart';
import 'package:{{name.snakeCase()}}/data/service/preferences/preferences.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/ui_refresh_controller.dart';

enum BottomNavBarItem {
  home("Img.home", "main"),
  services("Img.buildings", "myProperties"),
  payments("Img.coin", "myPayments"),
  other("Img.category", "other");

  final String asset;
  final String text;

  const BottomNavBarItem(this.asset, this.text);
  String get localizationItem => text.tr();
}

class MainProvider extends ChangeNotifier {
  MainProvider() {
    locator<UIRefreshController>().mainControllerStream.listen((e) {
      if (e == UIState.refreshed) {
        refreshUi();
      }
    });
  }
  int _currentIndex = 0;

  String version = "";
  int _count = 0;

  String _userName = "";

  String get userName => _userName;

  int get count => _count;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  Future<String> setUserName() async {
    final prefs = await PreferencesService.instance;
    _userName = prefs.fullName ?? "";
    return _userName;
  }

  Future<int> setCount() async {
    final prefs = await PreferencesService.instance;
    _count = prefs.count ?? 0;
    return _count;
  }

  List<BottomNavBarItem> get items => BottomNavBarItem.values;
  int get currentIndex => _currentIndex;

  refreshUi() {
    notifyListeners();
  }

  change(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
