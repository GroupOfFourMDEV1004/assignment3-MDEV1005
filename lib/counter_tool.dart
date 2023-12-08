import 'package:flutter/material.dart';

class CounterTool extends StatefulWidget {
  const CounterTool({super.key});

  @override
  _CounterToolState createState() => _CounterToolState();
}

class _CounterToolState extends State<CounterTool> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Tool'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

