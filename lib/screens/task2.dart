import 'package:flutter/material.dart';
import 'package:flutter_hw13/services/countdown_timer.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  late CountdownTimer _countdownTimer;
  late Stream<int> _timerStream;
  bool _isPaused = false;


  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  void dispose() {
    _countdownTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Таймер")),
      body: Center(
        child: StreamBuilder<int>(
          stream: _timerStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Очікування запуску таймера...");
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Text("Таймер завершено!");
            } else if (snapshot.hasData) {
              return Text(
                "Залишилось: ${snapshot.data} секунд",
                style: const TextStyle(fontSize: 24),
              );
            }
            return const Text("Невідомий стан.");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _resetTimer,
            tooltip: "Перезапустити таймер",
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _togglePauseResume,
            tooltip: _isPaused ? "Продовжити таймер" : "Поставити на паузу",
            child: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
          ),
        ],
      ),
    );
  }
  void _initializeTimer() {
    _countdownTimer = CountdownTimer();
    _timerStream = _countdownTimer.stream;
    _countdownTimer.startCountdown(duration: 10);
  }

  void _resetTimer() {
    _countdownTimer.dispose();
    setState(() {
      _initializeTimer();
      _isPaused = false;
    });
  }

  void _togglePauseResume() {
    if (_isPaused) {
      _countdownTimer.resumeCountdown();
    } else {
      _countdownTimer.pauseCountdown();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }
}
