import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class AppPhoneTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(PhoneNumber?)? validateFunction;
  const AppPhoneTextField({
    super.key,
    this.label,
    this.hintText,
    this.onChanged,
    this.validateFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: context.theme.textTheme.labelMedium,
          ),
        if (label != null) SizedBox(height: 10.h),
        IntlPhoneField(
          showCountryFlag: true,
          validator: validateFunction,
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: const Icon(Icons.keyboard_arrow_down),
          flagsButtonMargin: EdgeInsets.symmetric(horizontal: 10.w),
          style: context.theme.textTheme.displaySmall,
          pickerDialogStyle: PickerDialogStyle(
            backgroundColor: Colors.white,
            countryNameStyle: context.theme.textTheme.labelMedium,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            listTileDivider: 5.verticalSpace,
            listTilePadding: EdgeInsets.zero,
          ),
          dropdownDecoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color(0xFFD8D8DD),
              ),
            ),
          ),
          onChanged: (value) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            counterText: '',
            contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
            isDense: true,
            errorStyle: const TextStyle(fontSize: 0, height: -30),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF737380),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.danger),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD8D8DD)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD8D8DD)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFD8D8DD),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
