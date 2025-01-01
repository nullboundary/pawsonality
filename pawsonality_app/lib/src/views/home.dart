import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pawsonality'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to Pawsonality!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mbti_quiz');
              },
              child: const Text('Start New'),
            ),
          ],
        ),
      ),
    );
  }
}
