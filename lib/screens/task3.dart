import 'package:flutter/material.dart';
import 'package:flutter_hw13/services/real_time_data_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RealTimeDataScreen(),
    );
  }
}

class RealTimeDataScreen extends StatefulWidget {
  const RealTimeDataScreen({super.key});

  @override
  RealTimeDataScreenState createState() => RealTimeDataScreenState();
}

class RealTimeDataScreenState extends State<RealTimeDataScreen> {
  late RealTimeDataGenerator _dataGenerator;
  bool _isStreaming = false;

  @override
  void initState() {
    super.initState();
    _dataGenerator = RealTimeDataGenerator();
  }

  @override
  void dispose() {
    _dataGenerator.dispose();
    super.dispose();
  }

  void _toggleStream() {
    setState(() {
      if (_isStreaming) {
        _dataGenerator.stop();
      } else {
        _dataGenerator.start();
      }
      _isStreaming = !_isStreaming;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Потік даних'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<int>(
              stream: _dataGenerator.dataStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Очікування даних...'));
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Помилка: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      'Дані від користувача: ${snapshot.data}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                }
                return const Center(child: Text('Немає даних.'));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleStream,
        tooltip: _isStreaming ? 'Зупинити потік' : 'Запустити потік',
        child: Icon(_isStreaming ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}