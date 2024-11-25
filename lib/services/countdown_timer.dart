import 'dart:async';

class CountdownTimer {
  final StreamController<int> _controller = StreamController<int>.broadcast();
  Timer? _timer;
  int _remainingTime = 0;

  Stream<int> get stream => _controller.stream;

  void startCountdown({int duration = 10}) {
    _remainingTime = duration;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime > 0) {
          _controller.add(_remainingTime);
          _remainingTime--;
        } else {
          _controller.addError("Таймер завершено!");
          timer.cancel();
        }
      },
    );
  }

  void pauseCountdown() {
    _timer?.cancel();
  }

  void resumeCountdown() {
    _startTimer();
  }

  void dispose() {
    _timer?.cancel();
    if (!_controller.isClosed) {
      _controller.close();
    }
  }
}
