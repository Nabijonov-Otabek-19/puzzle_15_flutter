import 'dart:ui';

class Coordinate {
  int x;
  int y;

  Coordinate({
    required this.x,
    required this.y,
  });
}

class MyWidget {
  Color color;
  String text;

  MyWidget({
    required this.color,
    required this.text,
  });

  @override
  String toString() {
    return text;
  }
}
