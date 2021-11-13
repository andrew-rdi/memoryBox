import 'package:flutter/material.dart';
import 'package:memorybox/pages/recording/components/sound_player.dart';
import 'package:memorybox/pages/recording/components/sound_recorder.dart';
import 'package:memorybox/pages/recording/components/timer.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';

class Recording extends StatefulWidget {
  const Recording({Key? key}) : super(key: key);

  @override
  _RecordingState createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  final recorder = SoundRecorder();
  final timeController = TimerController();
  final player = SoundPlayer();

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    recorder.init();
    player.init();
  }

  @override
  void dispose() {
    player.dispose();
    recorder.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: [
            CustomScrollView(
              anchor: 0.23,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 8.0,
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: background,
                    ),
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: 580,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(),
                        ),
                        Visibility(
                          child: buildStart(),
                        ),
                        Visibility(
                          child: buildPlay(),
                          visible: _visible,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStart() {
    final isRecording = recorder.isRecordin;
    final icon = isRecording ? Icons.pause : Icons.play_arrow;
    final text = isRecording ? 'Запись' : '';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            text,
            style: const TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 200),
        buildTimer(),
        const SizedBox(height: 50),
        TextButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 80),
            shape: const CircleBorder(),
            primary: rose,
          ),
          child: Icon(icon),
          onPressed: () async {
            await recorder.toggleRecording();
            final isRecording = recorder.isRecordin;
            setState(() {});

            if (isRecording) {
              timeController.startTimer();
            } else {
              timeController.stoptTimer();
              _toggle();
            }
          },
        ),
      ],
    );
  }

  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;

    return TextButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(80, 80),
        shape: const CircleBorder(),
        primary: red,
      ),
      child: Icon(icon),
      onPressed: () async {
        await player.togglePlaying(whenFinished: () => setState(() {}));
        setState(() {});
      },
    );
  }

  Widget buildTimer() {
    return Column(
      children: [
        TimerWidget(controller: timeController),
        const SizedBox(height: 8),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }
}
