import 'package:netguru/local_data/netguru_value.dart';
import 'package:netguru/local_data/preferences.dart';

class NetguruValuesManager {
  final HivePreferences preferences = HivePreferences();

  Future<void> init() async {
    await preferences.init();
  }

  List<NetguruValue> get values => preferences.getNetguruValues();

  List<NetguruValue> get favorites =>
      values.where((element) => element.favorite).toList();

  void add(String value) => preferences.saveNetguruValue(
        NetguruValue(value, false),
      );

  void addToFavoritesAt(int index) {
    preferences.addNetguruValueToFavoritesAt(index);
  }

  void removeFromFavoritesAt(int index) {
    preferences.addNetguruValueToFavoritesAt(index);
  }
}
