import 'package:flutter/material.dart';
import 'package:tivi_tea/core/widget/custom_pin_text_field.dart';

/// Example demonstrating how to use CustomPinTextField independently
class CustomPinTextFieldExample extends StatefulWidget {
  const CustomPinTextFieldExample({super.key});

  @override
  State<CustomPinTextFieldExample> createState() => _CustomPinTextFieldExampleState();
}

class _CustomPinTextFieldExampleState extends State<CustomPinTextFieldExample> {
  final TextEditingController _pinController = TextEditingController();
  String _pinValue = '';

  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      setState(() {
        _pinValue = _pinController.text;
      });
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom PIN Text Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PIN Text Field (4 digits):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Basic PIN text field
            CustomPinTextField(
              pinCount: 4,
              controller: _pinController,
            ),
            
            const SizedBox(height: 32),
            
            // PIN text field with custom styling
            const Text(
              'Custom Styled PIN Text Field (6 digits):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            CustomPinTextField(
              pinCount: 6,
              controller: _pinController,
              digitWidth: 40,
              digitHeight: 40,
              digitBorderRadius: 20,
              digitFontSize: 20,
              filledDigitColor: Colors.blue,
              emptyDigitColor: Colors.grey,
              filledBorderColor: Colors.blue,
              emptyBorderColor: Colors.grey.shade300,
              borderWidth: 1,
            ),
            
            const SizedBox(height: 32),
            
            // Obscured PIN text field
            const Text(
              'Obscured PIN Text Field:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            CustomPinTextField(
              pinCount: 4,
              controller: _pinController,
              obscureText: true,
              obscureCharacter: '●',
              filledDigitColor: Colors.green,
              filledBorderColor: Colors.green,
            ),
            
            const SizedBox(height: 32),
            
            // Display current PIN value
            Text(
              'Current PIN: $_pinValue',
              style: const TextStyle(fontSize: 16),
            ),
            
            const SizedBox(height: 16),
            
            // Clear button
            ElevatedButton(
              onPressed: () {
                _pinController.clear();
              },
              child: const Text('Clear PIN'),
            ),
          ],
        ),
      ),
    );
  }
} 