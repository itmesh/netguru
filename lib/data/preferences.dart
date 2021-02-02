import 'dart:io';

import 'package:hive/hive.dart';
import 'package:netguru/helpers/string_csv_mapper.dart';

abstract class Preferences {
  static final netguruValuesKey = 'netguruValuesKey';
}

class HivePreferences extends Preferences {
  final _boxName = 'netguru';

  Box get box => Hive.box(_boxName);

  Future<void> init() async {
    Hive
      ..init(Directory.current.path);
      //..registerAdapter(PersonAdapter());
    await Hive.openBox('_boxName');
  }

  Future<List<String>> getNetguruValues() async {
    final String values = box.get(Preferences.netguruValuesKey) ?? '';
    if (values.isEmpty) {
      return [];
    } else {
      return StringCSVMapper.fromCSV(values);
    }
  }

  Future<void> removeNetguruValue(String value) async {
    final values = await getNetguruValues();
    if (values.isNotEmpty) {
      values.remove(value);
      await saveNetguruValues(StringCSVMapper.toCSV(values));
    }
  }

  Future<void> saveNetguruValues(String values) async {
    await saveNetguruValues(values);
  }

  Future<void> close() async {
    await box.close();
  }
}
