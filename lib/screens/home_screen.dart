import 'package:flutter/material.dart';
import 'package:flutter_hw13/styles/text_styles.dart';
import 'package:flutter_hw13/widgets/custom_button.dart';
import 'package:flutter_hw13/widgets/custom_app_bar.dart';
import 'package:flutter_hw13/screens/task1.dart';
import 'package:flutter_hw13/screens/task2.dart';
import 'package:flutter_hw13/screens/task3.dart';
import 'package:flutter_hw13/screens/task4.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: const CustomAppBar(title: 'Home Work 13'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyles.styledText('Welcome!', TextStyles.greetingsText),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChatScreen(),
                  ),
                );
              },
              text: 'Task 1',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TimerScreen(),
                  ),
                );
              },
              text: 'Task 2',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RealTimeDataScreen(),
                  ),
                );
              },
              text: 'Task 3',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RealTimeDataScreen(),
                  ),
                );
              },
              text: 'Task 4',
            ),
          ],
        ),
      ),
    );
  }
}
