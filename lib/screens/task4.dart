import 'package:flutter/material.dart';
import 'package:flutter_hw13/services/api_service.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  ApiScreenState createState() => ApiScreenState();
}

class ApiScreenState extends State<ApiScreen> {
  String _statusMessage = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Асинхронний API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _startApiCall,
              child: const Text('Почати'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startApiCall() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await ApiService.fetchDataFromApi((message) {
        setState(() {
          _statusMessage = message;
        });
      });

      setState(() {
        _statusMessage = result;
      });
    } catch (e) {
      setState(() {
        _statusMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
