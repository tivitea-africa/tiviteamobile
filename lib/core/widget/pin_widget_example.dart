// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_pin_widget.dart';

/// Example usage of the CustomPinWidget in various scenarios
class PinWidgetExample extends StatefulWidget {
  const PinWidgetExample({super.key});

  @override
  State<PinWidgetExample> createState() => _PinWidgetExampleState();
}

class _PinWidgetExampleState extends State<PinWidgetExample> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _modalPinController = TextEditingController();
  final TextEditingController _dialogPinController = TextEditingController();
  
  String _currentPin = '';
  String _modalPin = '';
  String _dialogPin = '';

  @override
  void dispose() {
    _pinController.dispose();
    _modalPinController.dispose();
    _dialogPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN Widget Examples'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic PIN Widget
            _buildSection(
              title: 'Basic PIN Widget (4 digits)',
              child: CustomPinWidget(
                pinCount: 4,
                controller: _pinController,
                onCompleted: (pin) {
                  setState(() {
                    _currentPin = pin;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('PIN completed: $pin')),
                  );
                },
                onChanged: (pin) {
                  setState(() {
                    _currentPin = pin;
                  });
                },
                onSubmit: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('PIN submitted: $pin')),
                  );
                },
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Current PIN display
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Current PIN: $_currentPin',
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Clear button
            ElevatedButton(
              onPressed: () {
                _pinController.clearPin();
                setState(() {
                  _currentPin = '';
                });
              },
              child: const Text('Clear PIN'),
            ),
            
            SizedBox(height: 30.h),
            
            // Customized PIN Widget
            _buildSection(
              title: 'Customized PIN Widget (6 digits)',
              child: CustomPinWidget(
                pinCount: 6,
                enableHapticFeedback: true,
                numberBackgroundColor: Colors.blue[50],
                numberTextColor: const Color(0xFF000050),
                numberWidth: 70.w,
                numberHeight: 70.h,
                numberBorderRadius: 35.r,
                numberBorder: Border.all(color: Colors.blue[200]!),
                numberFontSize: 28.sp,
                numberFontWeight: FontWeight.bold,
                deleteButtonColor: Colors.red[50],
                deleteIconColor: Colors.red[600],
                textFieldSpacing: 20.h,
                onCompleted: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('6-digit PIN completed: $pin')),
                  );
                },
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // PIN Widget without text field
            _buildSection(
              title: 'PIN Widget without Text Field',
              child: CustomPinWidget(
                pinCount: 4,
                showTextField: false,
                numberBackgroundColor: Colors.green[50],
                numberTextColor: Colors.green[800],
                numberBorder: Border.all(color: Colors.green[300]!),
                onCompleted: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('External PIN completed: $pin')),
                  );
                },
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // PIN Widget without pinCount (unlimited input)
            _buildSection(
              title: 'PIN Widget without PIN Count (Unlimited Input)',
              child: CustomPinWidget(
                showTextField: false,
                numberBackgroundColor: Colors.orange[50],
                numberTextColor: Colors.orange[800],
                numberBorder: Border.all(color: Colors.orange[300]!),
                onChanged: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Current input: $pin')),
                  );
                },
                onSubmit: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Submitted: $pin')),
                  );
                },
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // Buttons to show different examples
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showModalExample,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Show in Modal'),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showDialogExample,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Show in Dialog'),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20.h),
            
            // Obscured PIN Widget
            _buildSection(
              title: 'Obscured PIN Widget',
              child: CustomPinWidget(
                pinCount: 4,
                obscureText: true,
                obscureCharacter: '🔒',
                numberBackgroundColor: Colors.amber[50],
                numberTextColor: Colors.amber[800],
                onCompleted: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Obscured PIN completed: $pin')),
                  );
                },
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // Disabled PIN Widget
            _buildSection(
              title: 'Disabled PIN Widget',
              child: CustomPinWidget(
                pinCount: 4,
                enabled: false,
                numberBackgroundColor: Colors.grey[200],
                numberTextColor: Colors.grey[600],
                onCompleted: (pin) {
                  // This won't be called when disabled
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000050),
          ),
        ),
        SizedBox(height: 10.h),
        child,
      ],
    );
  }

  void _showModalExample() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            
            SizedBox(height: 20.h),
            
            Text(
              'Enter PIN in Modal',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 20.h),
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomPinWidget(
                  pinCount: 4,
                  controller: _modalPinController,
                  enableHapticFeedback: true,
                  numberBackgroundColor: Colors.blue[50],
                  numberTextColor: const Color(0xFF000050),
                  numberWidth: 80.w,
                  numberHeight: 80.h,
                  onCompleted: (pin) {
                    setState(() {
                      _modalPin = pin;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Modal PIN completed: $pin')),
                    );
                  },
                  onChanged: (pin) {
                    setState(() {
                      _modalPin = pin;
                    });
                  },
                ),
              ),
            ),
            
            // Current PIN display
            Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Modal PIN: $_modalPin',
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _showDialogExample() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter PIN'),
        content: SizedBox(
          width: double.maxFinite,
          child: CustomPinWidget(
            pinCount: 4,
            controller: _dialogPinController,
            enableHapticFeedback: true,
            numberBackgroundColor: Colors.purple[50],
            numberTextColor: Colors.purple[800],
            numberWidth: 60.w,
            numberHeight: 60.h,
            onCompleted: (pin) {
              setState(() {
                _dialogPin = pin;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Dialog PIN completed: $pin')),
              );
            },
            onChanged: (pin) {
              setState(() {
                _dialogPin = pin;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _dialogPinController.clearPin();
              setState(() {
                _dialogPin = '';
              });
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 