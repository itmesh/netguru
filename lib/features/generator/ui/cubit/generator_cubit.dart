import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netguru/helpers/netguru_values_manager.dart';

final _generatorInterval = Duration(seconds: 5);

class GeneratorCubit extends Cubit<GeneratorState> {
  final NetguruValuesManager _valuesManager;
  final Random _random;
  Timer timer;

  GeneratorCubit(
    state,
    this._valuesManager,
    this._random,
  ) : super(state);

  void addToFavorites() {
    _valuesManager.addToFavoritesAt(state.valueIndex);
    emit(state.copyWith(favorite: true));
  }

  void removeFromFavorites() {
    _valuesManager.addToFavoritesAt(state.valueIndex);
    emit(state.copyWith(favorite: false));
  }

  void startGenerator() {
    timer = Timer.periodic(_generatorInterval, (timer) {
      final nextIndex = _random.nextInt(_valuesManager.values.length);
      final netguruValue = _valuesManager.values[nextIndex];
      emit(GeneratorState(
        valueIndex: nextIndex,
        favorite: netguruValue.favorite,
        value: netguruValue.value,
      ));
    });
  }

  void stopGenerator() {
    timer.cancel();
  }
}

class GeneratorState extends Equatable {
  final int valueIndex;
  final bool favorite;
  final String value;

  GeneratorState({
    this.valueIndex,
    this.favorite,
    this.value,
  });

  GeneratorState copyWith({
    int valueIndex,
    bool favorite,
    String value,
  }) =>
      GeneratorState(
        valueIndex: valueIndex ?? this.valueIndex,
        favorite: favorite ?? this.favorite,
        value: value ?? this.value,
      );

  @override
  List<Object> get props => [valueIndex, favorite, value];
}
