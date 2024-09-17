// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puzzle_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PuzzleState {
  List<List<MyWidget?>> get items => throw _privateConstructorUsedError;
  List<int> get numbers => throw _privateConstructorUsedError;
  Coordinate? get coordinate => throw _privateConstructorUsedError;
  String get timer => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PuzzleStateCopyWith<PuzzleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuzzleStateCopyWith<$Res> {
  factory $PuzzleStateCopyWith(
          PuzzleState value, $Res Function(PuzzleState) then) =
      _$PuzzleStateCopyWithImpl<$Res, PuzzleState>;
  @useResult
  $Res call(
      {List<List<MyWidget?>> items,
      List<int> numbers,
      Coordinate? coordinate,
      String timer,
      int score,
      int length,
      int number});
}

/// @nodoc
class _$PuzzleStateCopyWithImpl<$Res, $Val extends PuzzleState>
    implements $PuzzleStateCopyWith<$Res> {
  _$PuzzleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? numbers = null,
    Object? coordinate = freezed,
    Object? timer = null,
    Object? score = null,
    Object? length = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<List<MyWidget?>>,
      numbers: null == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate?,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PuzzleStateImplCopyWith<$Res>
    implements $PuzzleStateCopyWith<$Res> {
  factory _$$PuzzleStateImplCopyWith(
          _$PuzzleStateImpl value, $Res Function(_$PuzzleStateImpl) then) =
      __$$PuzzleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<MyWidget?>> items,
      List<int> numbers,
      Coordinate? coordinate,
      String timer,
      int score,
      int length,
      int number});
}

/// @nodoc
class __$$PuzzleStateImplCopyWithImpl<$Res>
    extends _$PuzzleStateCopyWithImpl<$Res, _$PuzzleStateImpl>
    implements _$$PuzzleStateImplCopyWith<$Res> {
  __$$PuzzleStateImplCopyWithImpl(
      _$PuzzleStateImpl _value, $Res Function(_$PuzzleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? numbers = null,
    Object? coordinate = freezed,
    Object? timer = null,
    Object? score = null,
    Object? length = null,
    Object? number = null,
  }) {
    return _then(_$PuzzleStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<List<MyWidget?>>,
      numbers: null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate?,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PuzzleStateImpl implements _PuzzleState {
  const _$PuzzleStateImpl(
      {final List<List<MyWidget?>> items = const [],
      final List<int> numbers = const [],
      this.coordinate,
      this.timer = "00:00",
      this.score = 0,
      this.length = 0,
      this.number = 0})
      : _items = items,
        _numbers = numbers;

  final List<List<MyWidget?>> _items;
  @override
  @JsonKey()
  List<List<MyWidget?>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<int> _numbers;
  @override
  @JsonKey()
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  final Coordinate? coordinate;
  @override
  @JsonKey()
  final String timer;
  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final int length;
  @override
  @JsonKey()
  final int number;

  @override
  String toString() {
    return 'PuzzleState(items: $items, numbers: $numbers, coordinate: $coordinate, timer: $timer, score: $score, length: $length, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuzzleStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_numbers),
      coordinate,
      timer,
      score,
      length,
      number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PuzzleStateImplCopyWith<_$PuzzleStateImpl> get copyWith =>
      __$$PuzzleStateImplCopyWithImpl<_$PuzzleStateImpl>(this, _$identity);
}

abstract class _PuzzleState implements PuzzleState {
  const factory _PuzzleState(
      {final List<List<MyWidget?>> items,
      final List<int> numbers,
      final Coordinate? coordinate,
      final String timer,
      final int score,
      final int length,
      final int number}) = _$PuzzleStateImpl;

  @override
  List<List<MyWidget?>> get items;
  @override
  List<int> get numbers;
  @override
  Coordinate? get coordinate;
  @override
  String get timer;
  @override
  int get score;
  @override
  int get length;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$PuzzleStateImplCopyWith<_$PuzzleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
