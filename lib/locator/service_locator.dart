import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  _setUpHelpers();
}

void _setUpHelpers() {
  getIt.registerSingleton<Random>(Random());
  getIt.registerSingleton<NetguruValuesManager>(NetguruValuesManager());
}
