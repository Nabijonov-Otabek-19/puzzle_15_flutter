part of 'puzzle_cubit.dart';

@freezed
class PuzzleState with _$PuzzleState {
  const factory PuzzleState({
    @Default([]) List<List<MyWidget?>> items,
    @Default([]) List<int> numbers,
    Coordinate? coordinate,
    @Default("00:00") String timer,
    @Default(0) int score,
    @Default(0) int length,
    @Default(0) int number,
  }) = _PuzzleState;
}
