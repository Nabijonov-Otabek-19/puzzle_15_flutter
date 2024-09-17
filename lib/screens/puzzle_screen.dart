import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15_flutter/cubit/puzzle_cubit.dart';

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
  double width = 0;
  double height = 0;

  final cubit = PuzzleCubit();

  @override
  void initState() {
    super.initState();
    cubit.loadData(widget.number, context);
    cubit.dataToView(context);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text("${widget.number} Puzzle Game"),
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
                    BlocBuilder<PuzzleCubit, PuzzleState>(
                      buildWhen: (pr, cr) => pr.score != cr.score,
                      builder: (context, state) {
                        return Text(
                          "Score: ${state.score}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<PuzzleCubit, PuzzleState>(
                      buildWhen: (pr, cr) => pr.timer != cr.timer,
                      builder: (context, state) {
                        return Text(
                          "Timer: ${state.timer}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 300,
                child: BlocBuilder<PuzzleCubit, PuzzleState>(
                  builder: (context, state) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: sqrt(widget.number).toInt(),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: widget.number,
                      itemBuilder: (context, index) {
                        int sqr = sqrt(widget.number).toInt();
                        int y = index ~/ sqr;
                        int x = index % sqr;
                        final data = state.items[y][x]!;

                        return InkWell(
                          onTap: () async {
                            cubit.onItemClick(data, x, y, context);
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
                onPressed: () => cubit.dataToView(context),
                icon: const Icon(
                  Icons.refresh,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
