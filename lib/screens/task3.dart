import 'package:flutter/material.dart';
import 'package:flutter_hw13/services/real_time_data_generator.dart';
import 'package:flutter_hw13/widgets/custom_app_bar.dart';
import 'package:flutter_hw13/styles/text_styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Потік даних'),
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
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Помилка: ${snapshot.error}',
                        style: TextStyles.greetingsText,
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      'Дані від користувача: ${snapshot.data}',
                      style: TextStyles.defaultText,
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
        shape: const CircleBorder(),
        backgroundColor: Colors.blueGrey,
        onPressed: _toggleStream,
        tooltip: _isStreaming ? 'Зупинити потік' : 'Запустити потік',
        child: Icon(
          _isStreaming ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
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
}
