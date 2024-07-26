import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/transaction_container.dart';
import 'package:tivi_tea/screens/service_provider/dashboard/widget/info_card.dart';
import 'package:tivi_tea/screens/service_provider/dashboard/widget/pie_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: 22.5,
          backgroundImage: AssetImage(
            PlaceholderAssets.pfp,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.deepBlue,
              ),
            ),
            Text(
              'Richard Steinberg',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.fontColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification,
              color: AppColors.deepBlue,
            ),
          ),
          const Gap(8),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Iconsax.menu,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: Column(
          children: [
            totalEarningWidget(),
            const Gap(16),
            financialSummaryWidget(),
            const Gap(16),
            bookingSummaryWidget(),
            const Gap(16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Activities',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepBlue),
              ),
            ),
            const Gap(16),
            recentActivitiesWidget(),
          ],
        ),
      ),
    );
  }

  Widget totalEarningWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Total Earning',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 10),
        const Text(
          '₦ 85,000.81',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                SizedBox(width: 5),
                Text(
                  '32.54%',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Handle view report action
              },
              child: const Text(
                'View Report',
                style: TextStyle(
                    color: Color(0xFF5041BC),
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        const Gap(31),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoCard(
                count: '12',
                label: 'Total Listing',
                icon: Icons.list_alt,
                backgroundColor: const Color(0xFFF9E6D0),
                iconColor: const Color(0xFFEC8305),
              ),
              const Gap(10),
              InfoCard(
                count: '85',
                label: 'Total Bookings',
                icon: Icons.bookmark,
                backgroundColor: const Color(0xFFCCCCDC),
                iconColor: AppColors.deepBlue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dropDownRow(String title) {
    String dropdownValue = 'Weekly';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue),
        ),
        const Spacer(),
        Container(
          height: 25,
          width: 95,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Weekly', 'Monthly', 'Yearly']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 10),
        PopupMenuButton<int>(
          onSelected: (int result) {
            // Handle selection
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 0,
              child: Text('Option 1'),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text('Option 2'),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text('Option 3'),
            ),
          ],
          icon: const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ],
    );
  }

  Widget financialSummaryWidget() {
    return Container(
      height: 190.62,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          dropDownRow('Financial Summary'),
          const Gap(8),
          barChart(),
        ],
      ),
    );
  }

  Widget bookingSummaryWidget() {
    return Container(
      height: 206.62,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          dropDownRow('Booking Summary'),
          const Gap(8),
          const PieChartWidget(),
        ],
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

  Widget barChart() {
    return Container(); // Replace with your actual bar chart widget
  }
}
