import 'package:flutter/material.dart';
import 'package:puzzle_15_flutter/screens/puzzle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                navigateTo(9);
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(width, 50)),
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              child: const Text(
                "Easy level",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () {
                navigateTo(16);
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(width, 50)),
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              child: const Text(
                "Medium level",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () {
                navigateTo(25);
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(width, 50)),
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              child: const Text(
                "Hard level",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(int number) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PuzzleBoardScreen(number: number),
        ));
  }
}
