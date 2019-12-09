


import 'package:flutter_taia_care/src/model/base_model.dart';
import 'package:flutter_taia_care/src/provider/dashboard_viewmodel.dart';
import 'package:flutter_taia_care/src/provider/register_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RegisterViewModel());
  locator.registerFactory(() => BaseModel());
  locator.registerLazySingleton(() => DashboardProvider());
}
