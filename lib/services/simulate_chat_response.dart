import 'dart:async';
import 'dart:math';

class SimulateChatResponse {
  Future<String> simulateChatResponse(String userMessage) async {
    final random = Random();
    final delay = Duration(seconds: random.nextInt(3) + 2);

    await Future.delayed(delay);

    if (userMessage.contains('погано')) {
      return 'Щось пішло не так! Спробуйте ще раз.';
    } else if (userMessage.contains("добре")) {
      return 'Я радий, що вам подобається!';
    } else if (userMessage.contains('яка погода')) {
      await Future.delayed(const Duration(seconds: 5));

      return 'Температура зараз: ${random.nextInt(30) + 1}°C.';
    } else {
      return 'Я не зовсім зрозумів ваше питання. Спробуйте ще раз. У вас все вийде!';
    }
  }
}
