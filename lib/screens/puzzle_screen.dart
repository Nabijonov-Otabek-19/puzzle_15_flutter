import 'dart:math';

import 'package:flutter/material.dart';
import 'package:puzzle_15_flutter/my_model.dart';

class PuzzleBoardScreen extends StatefulWidget {
  final int number;

  const PuzzleBoardScreen({
    super.key,
    required this.number,
  });

  @override
  State<PuzzleBoardScreen> createState() => _PuzzleBoardScreenState();
}

class _PuzzleBoardScreenState extends State<PuzzleBoardScreen> {
  List<List<MyWidget?>> items = [];
  List<int> numbers = [];
  Coordinate? emptySpace;

  int score = 0;
  int length = 0;

  final itemColor = Colors.blue;
  final itemEmpty = Colors.white;

  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    loadData();
    dataToView();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('15 Puzzle Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Score: $score",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Timer: 0",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: sqrt(widget.number).toInt(),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: widget.number,
                itemBuilder: (context, index) {
                  int sqr = sqrt(widget.number).toInt();
                  int y = (index / sqr).toInt();
                  int x = index % sqr;
                  final data = items[y][x]!;

                  return InkWell(
                    onTap: () async {
                      onItemClick(data, x, y);
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: data.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          data.text,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            IconButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                elevation: WidgetStatePropertyAll(4),
              ),
              onPressed: () => restart(),
              icon: const Icon(Icons.refresh, size: 40, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }

  void loadData() {
    int number = widget.number;
    length = sqrt(number).toInt();
    emptySpace = Coordinate(x: length - 1, y: length - 1);

    numbers = List.generate(number - 1, (index) => index + 1);
    // Use List.generate for unique lists
    items = List.generate(length, (i) => List.filled(length, null));
  }

  void onItemClick(MyWidget button, int x, int y) {
    int dx = (emptySpace!.x - x).abs();
    int dy = (emptySpace!.y - y).abs();

    if (dx + dy == 1) {
      score = ++score;

      final text = button.text.toString();
      button.text = "";
      button.color = itemEmpty;

      final temp = items[emptySpace!.y][emptySpace!.x];
      temp?.text = text;
      temp?.color = itemColor;

      emptySpace!.x = x;
      emptySpace!.y = y;

      checkWin();
    }
  }

  void checkWin() {
    bool isWin = false;
    if (emptySpace!.x == length - 1 && emptySpace!.y == length - 1) {
      for (int i = 0; i < 8; i++) {
        if (items[(i / length).toInt()][i % length]?.text.toString() ==
            (i + 1).toString()) {
          isWin = true;
        } else {
          isWin = false;
          break;
        }
      }
    }
    if (isWin) {
      print("You win");
      restart();
    }
  }

  void dataToView() {
    score = 0;
    numbers.shuffle();

    final data = MyWidget(color: itemEmpty, text: "");
    items[emptySpace!.y][emptySpace!.x] = data;

    emptySpace!.x = length - 1;
    emptySpace!.y = length - 1;

    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
        int index = length * i + j;
        if (index < widget.number - 1) {
          int number = numbers[index];

          final data = MyWidget(color: itemColor, text: number.toString());
          items[i][j] = data;
        } else {
          final data = MyWidget(color: itemEmpty, text: "");
          items[i][j] = data;
        }
      }
    }
  }

  void restart() {
    dataToView();
    setState(() {});
  }
}
