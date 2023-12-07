import 'package:assigment3/counter_tool.dart';
import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting Page'),
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
            SizedBox(height: 20.0),
            Text(
              'Hello, Welcome!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterTool()),
                );
              },
              child: Text('Tool 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second tool screen
              },
              child: Text('Tool 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the third tool screen
              },
              child: Text('Tool 3'),
            ),
          ],
        ),
      ),
    );
  }
}

