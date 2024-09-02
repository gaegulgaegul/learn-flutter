import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinute = 1500;
  int totalSeconds = twentyFiveMinute;
  bool isRunning = false;
  bool isStarting = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = twentyFiveMinute;
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
      });
      timer.cancel();
      return;
    }
    setState(() {
      totalSeconds = totalSeconds - 1;
      isStarting = isStarting || totalSeconds < twentyFiveMinute;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    if (timer.isActive) {
      timer.cancel();
    }
    setState(() {
      totalSeconds = twentyFiveMinute;
      isRunning = true;
    });
    timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick
    );
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = twentyFiveMinute;
      totalPomodoros = 0;
      isRunning = false;
      isStarting = totalSeconds < twentyFiveMinute;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var time = duration.toString().split('.').first;
    return time.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 80,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.not_started_outlined),
              ),
            )
          ),
          Flexible(
              flex: 1,
              child: Center(
                child: (isRunning || isStarting) ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 60,
                      color: Theme.of(context).cardColor,
                      onPressed: onRestartPressed,
                      icon: const Icon(Icons.restore_outlined),
                    ),
                    IconButton(
                      iconSize: 60,
                      color: Theme.of(context).cardColor,
                      onPressed: onResetPressed,
                      icon: const Icon(Icons.settings_backup_restore_outlined),
                    ),
                  ],
                ) : Container(),
              )
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
