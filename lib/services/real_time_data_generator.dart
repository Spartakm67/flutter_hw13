import 'dart:async';
import 'dart:math';

class RealTimeDataGenerator {
  final StreamController<int> _dataController = StreamController<int>.broadcast();
  Timer? _timer;

  Stream<int> get dataStream => _dataController.stream;

  void start() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final randomValue = Random().nextInt(100) + 1;
      _dataController.add(randomValue);

      if (randomValue > 90) {
        _dataController.addError('Значення перевищує норму! ($randomValue)');
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
    _dataController.close();
  }
}
