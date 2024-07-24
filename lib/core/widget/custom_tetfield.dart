import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String fieldName;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double fontSize;

  const CustomFormTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.fieldName,
    required this.keyboardType,
    this.controller,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(4),
          SizedBox(
            height: 48,
            child: FormBuilderTextField(
              name: fieldName,
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;

  const NumberField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepBlue),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepBlue),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepBlue),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            onFieldSubmitted();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Empty';
          }
          return null;
        },
      ),
    );
  }
}
