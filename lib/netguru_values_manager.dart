import 'package:netguru/local_data/netguru_value.dart';
import 'package:netguru/local_data/preferences.dart';

class NetguruValuesManager {
  final HivePreferences preferences = HivePreferences();

  List<NetguruValue> _values;

  Future<void> init() async {
    await preferences.init();
    _values = preferences.getNetguruValues();
  }

  List<NetguruValue> get values => _values;

  List<NetguruValue> get favorites =>
      values.where((element) => element.favorite).toList();

  void add(String value) => preferences.saveNetguruValue(
        NetguruValue(value, false),
      );

  void addToFavoriteAt(int index) {
    final value = _values.removeAt(index);
    _values.insert(index, value.copyWith(favorite: true));
    preferences.addNetguruValueToFavoritesAt(index);
  }
}
