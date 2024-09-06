import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/home_section/home_screen.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE5EFE5),
              ),
              child: const Icon(
                Icons.check_circle,
                color: Color(0xFF1A8F1A),
                size: 40,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Payment Successful!',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your payment was successful',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF737373),
              ),
            ),
            SizedBox(height: 20.h),
            FullButton(
              bgColor: const Color(0xff000050),
              text: 'Download E-Receipt',
              width: double.infinity,
              height: 40.sp,
              onPressed: () {},
              color: Colors.white,
            ),
            SizedBox(height: 15.h),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => HomeScreen()));
              },
              child: Text(
                'Back to Home',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff000050),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
