import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsi_mobile_template/app/view/app_runner.dart';
import 'package:shamsi_mobile_template/app/view/delegate.dart';
import 'package:shamsi_mobile_template/app/view/di.dart';

import 'presentation/manager/connection/connection_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.register();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ConnectionManager().initNoInternetListener();

  Bloc.observer = SimpleBlocObserver();

  runApp(const AppRunner());
}
