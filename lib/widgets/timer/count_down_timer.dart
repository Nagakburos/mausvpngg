import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key, required this.startTimer});

  final bool startTimer;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Duration duration = Duration();
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      duration = Duration(seconds: duration.inSeconds + 1);
    });
  }

  stopTimer() {
    timer?.cancel();
    timer = null;
    duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null || !widget.startTimer)
      widget.startTimer ? startTimer() : stopTimer();

    twoDigit(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));
    final hours = twoDigit(duration.inHours.remainder(60));

    return Text(
      "$hours: $minutes: $seconds",
      style: CustomStyle.dashboardTitleTextStyle,
    );
  }
}
