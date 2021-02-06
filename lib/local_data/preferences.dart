import 'package:hive/hive.dart';
import 'package:netguru/local_data/netguru_value.dart';
import 'package:netguru/resources/strings.dart';
import 'package:path_provider/path_provider.dart';

abstract class Preferences {
  static final netguruValuesKey = 'netguruValuesKey';

  void saveNetguruValue(NetguruValue value);

  List<NetguruValue> getNetguruValues();

  void addNetguruValueToFavoritesAt(int index);

  void removeNetguruValueAt(int index);
}

class HivePreferences extends Preferences {
  final _boxName = 'netguru_values';
  static List values = [];

  Box<NetguruValue> box;

  Future<void> init() async {
    final document = await getApplicationDocumentsDirectory();
    Hive
      ..init(document.path)
      ..registerAdapter(NetguruValueAdapter());
    bool exists = await Hive.boxExists(_boxName);
    box = await Hive.openBox(_boxName);
    if (!exists)
      box.addAll(Strings.netguruCoreValues.map((e) => NetguruValue(e, false)));
  }

  Future<void> close() async {
    await box.close();
  }

  @override
  List<NetguruValue> getNetguruValues() => box.values.toList();

  @override
  void addNetguruValueToFavoritesAt(int index) {
    box.putAt(index, box.getAt(index).copyWith(favorite: true));
  }

  @override
  void removeNetguruValueAt(int index) {
    box.putAt(index, box.getAt(index).copyWith(favorite: false));
  }

  @override
  void saveNetguruValue(NetguruValue value) {
    box.add(value);
  }
}
