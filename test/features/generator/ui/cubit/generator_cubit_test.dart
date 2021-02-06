import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru/features/generator/cubit/generator_cubit.dart';

import 'package:netguru/helpers/netguru_values_manager.dart';

class NetguruValuesManagerMock extends Mock implements NetguruValuesManager {}

class RandomMock extends Mock implements Random {}

main() {
  NetguruValuesManagerMock valuesManagerMock;
  RandomMock randomMock;

  setUp(() {
    valuesManagerMock = NetguruValuesManagerMock();
    randomMock = RandomMock();
  });

  test('addToFavorites should emit state with favorite value', () {
    // Given
    when(valuesManagerMock.addToFavoritesAt(any)).thenReturn(null);
    GeneratorState state = GeneratorState(
      valueIndex: 0,
      value: 'some value',
      favorite: false,
    );
    GeneratorCubit cubit = GeneratorCubit(
      state,
      valuesManagerMock,
      randomMock,
    );

    // Then
    expectLater(cubit, emitsInOrder([state.copyWith(favorite: true)]));

    // When
    cubit.addToFavorites();
  });

  test('addToFavorites should call _valuesManager.addToFavoritesAt once', () {
    // Given
    when(valuesManagerMock.addToFavoritesAt(any)).thenReturn(null);
    GeneratorState state = GeneratorState(
      valueIndex: 0,
      value: 'some value',
      favorite: false,
    );
    GeneratorCubit cubit = GeneratorCubit(
      state,
      valuesManagerMock,
      randomMock,
    );

    // When
    cubit.addToFavorites();

    // Then
    verify(valuesManagerMock.addToFavoritesAt(any)).called(1);
  });

  test('removeFromFavoritesAt should emit state with no favorite value', () {
    // Given
    when(valuesManagerMock.removeFromFavoritesAt(any)).thenReturn(null);
    GeneratorState state = GeneratorState(
      valueIndex: 0,
      value: 'some value',
      favorite: true,
    );
    GeneratorCubit cubit = GeneratorCubit(
      state,
      valuesManagerMock,
      randomMock,
    );

    // Then
    expectLater(cubit, emitsInOrder([state.copyWith(favorite: false)]));

    // When
    cubit.removeFromFavorites();
  });

  test(
      'removeFromFavoritesAt should call _valuesManager.removeFromFavoritesAt once',
      () {
    // Given
    when(valuesManagerMock.removeFromFavoritesAt(any)).thenReturn(null);
    GeneratorState state = GeneratorState(
      valueIndex: 0,
      value: 'some value',
      favorite: false,
    );
    GeneratorCubit cubit = GeneratorCubit(
      state,
      valuesManagerMock,
      randomMock,
    );

    // When
    cubit.removeFromFavorites();

    // Then
    verify(valuesManagerMock.removeFromFavoritesAt(any)).called(1);
  });

  test('addNewValue should call _valuesManager.add once', () {
    // Given
    final someValue = 'some value';
    when(valuesManagerMock.add(someValue)).thenReturn(null);
    GeneratorCubit cubit = GeneratorCubit(
      GeneratorState(),
      valuesManagerMock,
      randomMock,
    );

    // When
    cubit.addNewValue(someValue);

    // Then
    verify(valuesManagerMock.add(someValue)).called(1);
  });
}
