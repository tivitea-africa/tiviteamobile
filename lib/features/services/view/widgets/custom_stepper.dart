import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepTitles;
  final void Function(int) onTapStep;
  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepTitles,
    required this.onTapStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(totalSteps * 2 - 1, (index) {
                  if (index.isEven) {
                    return _buildStep(
                      context,
                      step: (index ~/ 2) + 1,
                      title: stepTitles[index ~/ 2],
                      onTap: () => onTapStep(index)
                    );
                  } else {
                    return Expanded(
                      child: _buildDivider(),
                    );
                  }
                }),
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                totalSteps,
                (index) {
                  final isActive = (index + 1) == currentStep;
                  return Text(
                    stepTitles[index],
                    style: isActive
                        ? context.theme.textTheme.titleLarge?.copyWith(
                            fontSize: 9,
                            color: context.theme.primaryColor,
                          )
                        : context.theme.textTheme.bodySmall?.copyWith(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required int step,
    required String title,
    required VoidCallback onTap,
  }) {
    final isActive = step == currentStep;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? context.theme.primaryColor : Colors.grey,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "$step",
          style: context.theme.textTheme.titleLarge?.copyWith(
            fontSize: 10,
            color: isActive ? context.theme.primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const DottedWidget(
      padding: EdgeInsets.zero,
      dashPattern: [4, 7],
      child: SizedBox(width: double.infinity),
    );
  }
}
