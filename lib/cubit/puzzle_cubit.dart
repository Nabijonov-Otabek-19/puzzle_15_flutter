import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15_flutter/model/my_model.dart';
import 'package:puzzle_15_flutter/utils/colors.dart';

part 'puzzle_state.dart';

part 'puzzle_cubit.freezed.dart';

class PuzzleCubit extends Cubit<PuzzleState> {
  PuzzleCubit() : super(const PuzzleState());

  Timer? _timer;

  void startTimer(BuildContext context) {
    // Cancel the timer if it's already running
    stopTimer();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if(context.mounted) {
        formatTime(timer.tick);
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  bool isRunning() {
    return _timer != null;
  }

  void formatTime(int time) {
    int minutes = time ~/ 60;
    int seconds = time % 60;
    final formattedTime ='${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    emit(state.copyWith(timer: formattedTime));
    debugPrint(formattedTime);
  }

  Future<void> loadData(int number, BuildContext context) async {
    final length = sqrt(number).toInt();

    final emptySpace = Coordinate(x: state.length - 1, y: state.length - 1);

    final numbers = List.generate(number - 1, (index) => index + 1);
    // Use List.generate for unique lists
    final items = List.generate(length, (i) => List.filled(length, null));

    emit(state.copyWith(
      coordinate: emptySpace,
      numbers: numbers,
      items: items,
      length: length,
      number: number,
    ));
  }

  void onItemClick(MyWidget button, int x, int y, BuildContext context) {
    int dx = (state.coordinate!.x - x).abs();
    int dy = (state.coordinate!.y - y).abs();

    if (dx + dy == 1) {
      int score = state.score;

      final text = button.text.toString();
      button.text = "";
      button.color = MyColors.itemEmpty;

      final temp = state.items[state.coordinate!.y][state.coordinate!.x];
      temp?.text = text;
      temp?.color = MyColors.itemColor;

      final item = state.items;
      item[state.coordinate!.y][state.coordinate!.x] = temp;

      var coordinate = state.coordinate;
      coordinate?.x = x;
      coordinate?.y = y;

      emit(state.copyWith(
        score: ++score,
        items: item,
        coordinate: coordinate,
      ));

      checkWin(context);
    }
  }

  void checkWin(BuildContext context) {
    bool isWin = false;
    if (state.coordinate!.x == state.length - 1 &&
        state.coordinate!.y == state.length - 1) {
      for (int i = 0; i < 8; i++) {
        if (state.items[i ~/ state.length][i % state.length]?.text.toString() ==
            (i + 1).toString()) {
          isWin = true;
        } else {
          isWin = false;
          break;
        }
      }
    }
    if (isWin) {
      debugPrint("You win");
      dataToView(context);
    }
  }

  void dataToView(BuildContext context) {
    startTimer(context);
    final emptySpace = Coordinate(x: state.length - 1, y: state.length - 1);
    emit(state.copyWith(coordinate: emptySpace));

    final numbers = List<int>.from(state.numbers);
    numbers.shuffle();
    emit(state.copyWith(score: 0, numbers: numbers));

    final data = MyWidget(color: MyColors.itemEmpty, text: "");

    // Copying the list
    var items = state.items
        .map((innerList) => List<MyWidget?>.from(innerList))
        .toList();

    items[state.coordinate!.y][state.coordinate!.x] = data;

    for (int i = 0; i < state.length; i++) {
      for (int j = 0; j < state.length; j++) {
        int index = state.length * i + j;
        if (index < state.number - 1) {
          int number = state.numbers[index];

          final data =
              MyWidget(color: MyColors.itemColor, text: number.toString());
          items[i][j] = data;
        } else {
          final data = MyWidget(color: MyColors.itemEmpty, text: "");
          items[i][j] = data;
        }
      }
    }
    emit(state.copyWith(items: items));
  }
}
