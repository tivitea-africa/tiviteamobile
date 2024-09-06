import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/custom_dialog.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/core/widget/reusbale_containers.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCard(),
            const Gap(16),
            const DatePicker(),
            const Gap(18),
            conContainer1(),
            const Gap(70),
            FullButton(
              text: 'Pay Now',
              width: double.infinity,
              height: 44,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomDialog();
                    });
              },
              color: Colors.white,
              bgColor: AppColors.deepBlue,
            ),
          ],
        ),
      ),
    );
  }

  Widget conContainer1() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pickup Location',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Main island, iweka road, Ikeja Lagos',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        contContainer(
          'Pickup date',
          '21st May 2024',
        ),
        Expanded(
          child: SizedBox(
            width: 20,
            child: CustomPaint(
              painter: DottedLinePainter(),
            ),
          ),
        ),
        contContainer(
          'Return date',
          '4th June 2024',
        ),
      ],
    );
  }

  Widget contContainer(String title, String date) {
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9D9DAA), width: 0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF9D9DAA)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
