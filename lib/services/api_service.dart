import 'dart:async';
import 'dart:math';

class ApiService {
  static Future<String> fetchDataFromApi(Function(String) updateStatus) async {
    try {
      updateStatus("Етап 1: Ініціалізація...");
      await Future.delayed(const Duration(seconds: 2));

      updateStatus("Етап 2: Запит до API...");
      await Future.delayed(const Duration(seconds: 3));
      if (Random().nextInt(10) == 5) {
        throw Exception("Помилка під час запиту до API.");
      }

      updateStatus("Етап 3: Обробка даних...");
      await Future.delayed(const Duration(seconds: 3));

      return 'Дані сервера: CPU - 50%, RAM - 70%, Storage - 80%.';
    } catch (e) {
      updateStatus("Сталася помилка: ${e.toString()}");
      rethrow;
    }
  }
}

