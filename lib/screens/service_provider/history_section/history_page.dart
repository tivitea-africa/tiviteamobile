import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/transaction_container.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> transactions = [
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Canon EOS 60D',
      'user': 'Esther Jeremiah',
      'date': '25 Jun 2024',
      'status': 'Completed',
      'amount': '₦ 25,000',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Regal Hub',
      'user': 'Esther Jeremiah',
      'date': '25 Jun 2024',
      'status': 'Completed',
      'amount': '₦ 25,000',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Canon EOS 60D',
      'user': 'Esther Jeremiah',
      'date': '25 Jun 2024',
      'status': 'Failed',
      'amount': '₦ 25,000',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Canon EOS 60D',
      'user': 'Esther Jeremiah',
      'date': '25 Jun 2024',
      'status': 'Pending',
      'amount': '₦ 25,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: AppColors.deepBlue,
            )),
        title: Center(
          child: Text(
            'History',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xff000050)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification,
              color: AppColors.deepBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.element_4,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(36),
            recentActivitiesWidget(),
          ],
        ),
      ),
    );
  }

  Widget recentActivitiesWidget() {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xFFE8E8EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true, // Important to ensure ListView works inside a Column
        physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return TransactionItem(
            imageUrl: transaction['imageUrl']!,
            title: transaction['title']!,
            user: transaction['user']!,
            date: transaction['date']!,
            status: transaction['status']!,
            amount: transaction['amount']!,
          );
        },
      ),
    );
  }
}
