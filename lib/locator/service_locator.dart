import 'package:get_it/get_it.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  _setupHelpers();
}

void _setupHelpers() {
  getIt.registerSingleton<NetguruValuesManager>(NetguruValuesManager());
}
