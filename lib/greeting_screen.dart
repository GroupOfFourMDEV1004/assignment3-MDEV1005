import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/greeting_image.jpg',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Hello, Welcome!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push("/counterTool");
              },
              child: const Text('Counter Tool'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push("/calculatorTool");
              },
              child: const Text('Calculator Tool'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push("/notesTool");
              },
              child: const Text('Notes Tool'),
            ),
          ],
        ),
      ),
    );
  }
}

