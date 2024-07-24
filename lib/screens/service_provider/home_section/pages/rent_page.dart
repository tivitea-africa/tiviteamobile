import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/core/widget/reusbale_containers.dart';
import 'package:tivi_tea/screens/service_provider/home_section/pages/summary_page.dart';

class RentalPage extends StatefulWidget {
  @override
  _RentalPageState createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  DateTime? _pickupDate;
  DateTime? _returnDate;

  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != (isPickup ? _pickupDate : _returnDate)) {
      setState(() {
        if (isPickup) {
          _pickupDate = picked;
        } else {
          _returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Rentingl Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCard(),
            const Gap(16),
            TextField(
              readOnly: true,
              onTap: () => _selectDate(context, true),
              decoration: InputDecoration(
                hintText: _pickupDate == null
                    ? '--/--/----'
                    : DateFormat.yMd().format(_pickupDate!),
                suffixIcon: const Icon(Icons.calendar_today),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              onTap: () => _selectDate(context, false),
              decoration: InputDecoration(
                hintText: _returnDate == null
                    ? '--/--/----'
                    : DateFormat.yMd().format(_returnDate!),
                suffixIcon: const Icon(Icons.calendar_today),
                border: const OutlineInputBorder(),
              ),
            ),
            const Gap(70),
            FullButton(
              text: 'Continue',
              width: double.infinity,
              height: 44,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SummaryPage(),
                  ),
                );
              },
              color: Colors.white,
              bgColor: AppColors.deepBlue,
            ),
          ],
        ),
      ),
    );
  }
}
