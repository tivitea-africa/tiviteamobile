import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingStep1 extends StatefulWidget {
  final String title;
  final ListingResponseModel listing;
  final void Function(BookingSummaryParams) moveToNextStep;
  const BookingStep1({
    super.key,
    required this.title,
    required this.listing,
    required this.moveToNextStep,
  });

  @override
  State<BookingStep1> createState() => _BookingStep1State();
}

class _BookingStep1State extends State<BookingStep1> {
  final TextEditingController _dateFromController = TextEditingController();
  final TextEditingController _dateToController = TextEditingController();
  late TextEditingController _numberOfPeople;

  DateTime? _selectedDateFrom;
  DateTime? _selectedDateTo;
  bool canProceed = false;

  final DateFormat _dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _numberOfPeople = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _dateFromController.dispose();
    _dateToController.dispose();
    _numberOfPeople.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWorkspace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;
    final bothDatesAreSelected =
        (_selectedDateFrom != null) && (_selectedDateTo != null);
    return Column(
      children: [
        Text(
          widget.title,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 22,
            color: context.theme.primaryColor,
          ),
        ),
        10.verticalSpace,
        Text(
          widget.listing.name ?? '',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: const Color(0xFF737380).withOpacity(0.6),
          ),
        ),
        Text(
          isWorkspace
              ? 'by ${widget.listing.partner?.user?.firstName ?? ''} ${widget.listing.partner?.user?.lastName ?? ''}'
              : widget.listing.address ?? '',
          style: context.theme.textTheme.displaySmall?.copyWith(
            fontSize: 11,
            color: const Color(0xFF737380).withOpacity(0.6),
          ),
        ),
        15.verticalSpace,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE8E8EB),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      AppTextField(
                        hintText: '--/--/----',
                        label: isWorkspace
                            ? context.l10n.dateFrom
                            : context.l10n.pickUpDate,
                        controller: _dateFromController,
                        showCursor: false,
                        suffixIcon: AppSvgWidget(
                          path: Assets.svgs.calendar,
                          fit: BoxFit.scaleDown,
                        ),
                        onTap: _selectDateFrom,
                      ),
                      AppTextField(
                        hintText: '--/--/----',
                        label: isWorkspace
                            ? context.l10n.dateTo
                            : context.l10n.returnDate,
                        controller: _dateToController,
                        showCursor: false,
                        suffixIcon: AppSvgWidget(
                          path: Assets.svgs.calendar,
                          fit: BoxFit.scaleDown,
                        ),
                        readOnly: true,
                        onTap: _selectDateTo,
                      ),
                      if (bothDatesAreSelected && (canProceed == false))
                        Text(
                          'Pick up date cannot be after Return date',
                          style: context.theme.textTheme.displaySmall?.copyWith(
                            color: AppColors.danger,
                          ),
                        ),
                      if (isWorkspace)
                        AppTextField(
                          label: context.l10n.numberOfPeople,
                          controller: _numberOfPeople,
                          suffixIcon: AppSvgWidget(
                            path: Assets.svgs.userGroup,
                            fit: BoxFit.scaleDown,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      20.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AppButton(
                          isEnabled: (bothDatesAreSelected && canProceed),
                          buttonText: context.l10n.continue_,
                          onPressed: () {
                            final data = BookingSummaryParams(
                              selectedDateFrom: _selectedDateFrom!,
                              selectedDateTo: _selectedDateTo!,
                              listing: widget.listing,
                              numOfPeople: int.parse(_numberOfPeople.text),
                            );

                            widget.moveToNextStep(data);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _selectDateFrom() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _selectedDateFrom = picked;
      _dateFromController.text = _dateFormatter.format(picked);
      _validateDates();
      setState(() {});
    }
  }

  void _selectDateTo() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _selectedDateTo = picked;
      _dateToController.text = _dateFormatter.format(picked);
      _validateDates();
      setState(() {});
    }
  }

  void _validateDates() {
    if (_selectedDateFrom != null && _selectedDateTo != null) {
      canProceed = _selectedDateFrom!.isBefore(_selectedDateTo!) ||
          _selectedDateFrom!.isAtSameMomentAs(_selectedDateTo!);
    } else {
      canProceed = false;
    }
  }
}
