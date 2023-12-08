import 'package:flutter/material.dart';

class CalculatorTool extends StatefulWidget {
  const CalculatorTool({super.key});

  @override
  _CalculatorToolState createState() => _CalculatorToolState();
}

class _CalculatorToolState extends State<CalculatorTool> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _resultValue = 0;
  String _operation = "";
  String _warningMessage = ""; // Variable for the warning message

  void _performOperation() {
    double input1 = double.tryParse(_controller1.text) ?? 0;
    double input2 = double.tryParse(_controller2.text) ?? 0;

    _warningMessage = ""; // Reset warning message on each operation

    switch (_operation) {
      case '+':
        _resultValue = input1 + input2;
        break;
      case '-':
        _resultValue = input1 - input2;
        break;
      case '*':
        _resultValue = input1 * input2;
        break;
      case '/':
        if (input2 == 0) {
          _warningMessage = "Note: Division by zero is not defined in mathematics. For simplicity, this calculator treats it as zero."; // Set warning message
          _resultValue = 0;
        } else {
          _resultValue = input1 / input2;
        }
        break;
      default:
        _resultValue = 0;
    }
    setState(() {});
  }

  void _setOperation(String opt) {
    setState(() {
      _operation = opt;
      _performOperation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Tool'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Input 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Input 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _setOperation("+"),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation("-"),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation("*"),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation("/"),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _warningMessage,
              textAlign: TextAlign.center, // Center-align the text
              style: const TextStyle(fontSize: 18.0, color: Colors.red),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Result: $_resultValue',
              style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}