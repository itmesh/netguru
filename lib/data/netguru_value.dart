import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NetguruValue {
  @HiveField(0)
  String value;
  @HiveField(1)
  bool favorite;

  @override
  String toString() {
    return 'NetguruValue{value: $value, favorite: $favorite}';
  }
}
