import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'netguru_value.g.dart';

@HiveType(typeId: 1)
class NetguruValue {
  @HiveField(0)
  final String value;
  @HiveField(1)
  final bool favorite;

  NetguruValue(this.value, this.favorite);

  @override
  String toString() {
    return 'NetguruValue{value: $value, favorite: $favorite}';
  }

  NetguruValue copyWith({String value, bool favorite}) => NetguruValue(
        value ?? this.value,
        favorite ?? this.favorite,
      );
}
