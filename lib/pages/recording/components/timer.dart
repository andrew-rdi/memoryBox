import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memorybox/resources/app_colors.dart';

class TimerController extends ValueNotifier<bool> {
  TimerController({bool isPalying = false}) : super(isPalying);

  void startTimer() => value = true;
  void stoptTimer() => value = false;
}

class TimerWidget extends StatefulWidget {
  final TimerController controller;

  const TimerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration = const Duration();

  Timer? timer;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.value) {
        startTimer();
      } else {
        stopTimer();
      }
    });
  }

  void reset() => setState(() => duration = const Duration());

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (!mounted) return;
    if (resets) {
      reset();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (!mounted) return;
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: red),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '$hours:$minutes:$seconds',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
