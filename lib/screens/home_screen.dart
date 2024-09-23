import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 15;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTickTock);
    setState(() {
      isRunning = true;
    });
  }

  void onTickTock(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });

    if (totalSeconds == 0) {
      timer.cancel();
      isRunning = false;
      totalPomodoros += 1;
      totalSeconds = 15;
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onPressedClear() {
    timer.cancel();
    setState(() {
      totalSeconds = 1500;
      isRunning = false;
      totalPomodoros = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 89.0,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          color: Theme.of(context).cardColor,
                          onPressed:
                              isRunning ? onPausePressed : onStartPressed,
                          icon: Icon(
                            isRunning
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                          ),
                          iconSize: 120.0,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        IconButton(
                          color: Theme.of(context).cardColor,
                          onPressed: onPressedClear,
                          icon: const Icon(
                            Icons.restart_alt_outlined,
                          ),
                          iconSize: 89.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$totalPomodoros / 12',
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
