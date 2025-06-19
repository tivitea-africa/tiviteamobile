// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/widgets/listing_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookWorkSpaceOrListingView extends StatefulWidget {
  final ListingResponseModel listing;
  const BookWorkSpaceOrListingView({super.key, required this.listing});

  @override
  State<BookWorkSpaceOrListingView> createState() =>
      _BookWorkSpaceOrListingViewState();
}

class _BookWorkSpaceOrListingViewState
    extends State<BookWorkSpaceOrListingView> {
  final TextEditingController _dateFromController = TextEditingController();
  final TextEditingController _dateToController = TextEditingController();
  final TextEditingController _timeFromController = TextEditingController();
  final TextEditingController _timeToController = TextEditingController();
  late TextEditingController _numberOfPeople;

  final FocusNode _dateFromFocusNode = FocusNode();
  final FocusNode _dateToFocusNode = FocusNode();
  final FocusNode _timeFromFocusNode = FocusNode();
  final FocusNode _timeToFocusNode = FocusNode();

  DateTime? _selectedDateFrom;
  DateTime? _selectedDateTo;
  TimeOfDay? _selectedTimeFrom;
  TimeOfDay? _selectedTimeTo;
  bool canProceed = false;
  bool canProceedTime = false;

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
    _timeFromController.dispose();
    _timeToController.dispose();
    _numberOfPeople.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workSpace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;
    final bothDatesAreSelected =
        (_selectedDateFrom != null) && (_selectedDateTo != null);
    final bothTimesAreSelected =
        (_selectedTimeFrom != null) && (_selectedTimeTo != null);
    return AppScaffold(
      appbar: const CustomAppBar(
        showHamburgerMenu: true,
        showBackButtonForHomeScreenAppBar: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.verticalSpace,
            WorkSpaceWidget(listing: widget.listing),
            50.verticalSpace,
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: AppTextField(
                            focusNode: _dateFromFocusNode,
                            hintText: '--/--/----',
                            label: workSpace
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
                        ),
                        10.horizontalSpace,
                        Flexible(
                          child: AppTextField(
                            focusNode: _timeFromFocusNode,
                            hintText: '-- : --',
                            label: 'Pick up time',
                            controller: _timeFromController,
                            showCursor: false,
                            suffixIcon: AppSvgWidget(
                              path: Assets.svgs.calendar,
                              fit: BoxFit.scaleDown,
                            ),
                            onTap: _selectTimeFrom,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AppTextField(
                            hintText: '--/--/----',
                            label: workSpace
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
                        ),
                        10.horizontalSpace,
                        Flexible(
                          child: AppTextField(
                            hintText: '-- : --',
                            label: 'Return time',
                            controller: _timeToController,
                            showCursor: false,
                            suffixIcon: AppSvgWidget(
                              path: Assets.svgs.calendar,
                              fit: BoxFit.scaleDown,
                            ),
                            onTap: _selectTimeTo,
                          ),
                        ),
                      ],
                    ),
                    if (bothDatesAreSelected && (canProceed == false))
                      Text(
                        'Pick up date cannot be after Return date',
                        style: context.theme.textTheme.displaySmall?.copyWith(
                          color: AppColors.danger,
                        ),
                      ),
                    if (bothTimesAreSelected && (canProceedTime == false))
                      Text(
                        'Pick up time cannot be after Return time',
                        style: context.theme.textTheme.displaySmall?.copyWith(
                          color: AppColors.danger,
                        ),
                      ),
                    if (workSpace)
                      AppTextField(
                        label: context.l10n.numberOfPeople,
                        controller: _numberOfPeople,
                        suffixIcon: AppSvgWidget(
                          path: Assets.svgs.userGroup,
                          fit: BoxFit.scaleDown,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    50.verticalSpace,
                    AppButton(
                      isEnabled: (bothDatesAreSelected && canProceed),
                      buttonText: context.l10n.next,
                      onPressed: _navigate,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime _mergeDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  void _navigate() {
    if (_selectedDateFrom == null ||
        _selectedDateTo == null ||
        _selectedTimeFrom == null ||
        _selectedTimeTo == null) {
      return;
    }

    final DateTime startDateTime = _mergeDateAndTime(_selectedDateFrom!, _selectedTimeFrom!);
    final DateTime endDateTime = _mergeDateAndTime(_selectedDateTo!, _selectedTimeTo!);

    final bool isWorkSpace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;
    if (isWorkSpace) {
      final data = BookingSummaryParams(
        selectedDateFrom: startDateTime,
        selectedDateTo: endDateTime,
        listing: widget.listing,
        numOfPeople: int.parse(_numberOfPeople.text),
      );
      context.push(
        '${AppRoutes.servicesView}/${AppRoutes.chooseRoomView}',
        extra: ChooseRoomViewParams(
          bookingSummaryParams: data,
          rooms: widget.listing.rooms ?? [],
        ),
      );
    } else {
      context.push(
        '${AppRoutes.servicesView}/${AppRoutes.bookingSummaryView}',
        extra: BookingSummaryParams(
          selectedDateFrom: startDateTime,
          selectedDateTo: endDateTime,
          listing: widget.listing,
          numOfPeople: int.parse(_numberOfPeople.text),
        ),
      );
    }
  }

  Future<DateTime?> _selectDate(DateTime initialDate) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
  }

  Future<TimeOfDay?> _selectTime() async {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }

  void _handleDateSelection({
    required bool isFromDate,
    required DateTime? selectedDate,
    required TextEditingController controller,
    required FocusNode nextFocusNode,
  }) {
    if (selectedDate != null) {
      if (isFromDate) {
        _selectedDateFrom = selectedDate;
      } else {
        _selectedDateTo = selectedDate;
      }
      controller.text = _dateFormatter.format(selectedDate);
      _validateDates();
      nextFocusNode.requestFocus();
      setState(() {});
    }
  }

  void _handleTimeSelection({
    required bool isFromTime,
    required TimeOfDay? selectedTime,
    required TextEditingController controller,
    required FocusNode nextFocusNode,
  }) {
    if (selectedTime != null) {
      if (isFromTime) {
        _selectedTimeFrom = selectedTime;
      } else {
        _selectedTimeTo = selectedTime;
      }
      controller.text = selectedTime.format(context);
      _validateTimes();
      nextFocusNode.requestFocus();
      setState(() {});
    }
  }

  void _selectDateFrom() async {
    final picked = await _selectDate(DateTime.now());
    _handleDateSelection(
      isFromDate: true,
      selectedDate: picked,
      controller: _dateFromController,
      nextFocusNode: _timeFromFocusNode,
    );
  }

  void _selectTimeFrom() async {
    final time = await _selectTime();
    _handleTimeSelection(
      isFromTime: true,
      selectedTime: time,
      controller: _timeFromController,
      nextFocusNode: _dateToFocusNode,
    );
  }

  void _selectDateTo() async {
    final picked = await _selectDate(DateTime.now());
    _handleDateSelection(
      isFromDate: false,
      selectedDate: picked,
      controller: _dateToController,
      nextFocusNode: _timeToFocusNode,
    );
  }

  void _selectTimeTo() async {
    final time = await _selectTime();
    _handleTimeSelection(
      isFromTime: false,
      selectedTime: time,
      controller: _timeToController,
      nextFocusNode: _dateToFocusNode,
    );
  }

  void _validateDates() {
    if (_selectedDateFrom != null && _selectedDateTo != null) {
      canProceed = _selectedDateFrom!.isBefore(_selectedDateTo!) ||
          _selectedDateFrom!.isAtSameMomentAs(_selectedDateTo!);
    } else {
      canProceed = false;
    }
  }

  void _validateTimes() {
    if (_selectedTimeFrom != null && _selectedTimeTo != null) {
      // First check if dates are valid
      if (_selectedDateFrom == null || _selectedDateTo == null) {
        canProceedTime = false;
        setState(() {});
        return;
      }

      // If dates are different, only validate if return date is after pickup date
      if (!_selectedDateFrom!.isAtSameMomentAs(_selectedDateTo!)) {
        canProceedTime = _selectedDateFrom!.isBefore(_selectedDateTo!);
        setState(() {});
        return;
      }

      // If same date, validate the times
      canProceedTime = _selectedTimeFrom!.hour < _selectedTimeTo!.hour ||
          (_selectedTimeFrom!.hour == _selectedTimeTo!.hour &&
              _selectedTimeFrom!.minute < _selectedTimeTo!.minute);
      setState(() {});
    } else {
      canProceedTime = false;
      setState(() {});
    }
  }
}
