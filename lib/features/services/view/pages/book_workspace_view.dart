import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
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
  late TextEditingController _numberOfPeople;

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
    final workSpace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;
    return AppScaffold(
      appbar: CustomAppBar(
        showHamburgerMenu: true,
        showBackButtonForHomeScreenAppBar: true,
        onHomeBackButtonTap: () => context.pop(),
      ),
      body: Column(
        children: [
          30.verticalSpace,
          WorkSpaceWidget(listing: widget.listing),
          50.verticalSpace,
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  AppTextField(
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
                  AppTextField(
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
                    buttonText: context.l10n.next,
                    onPressed: () => context.push(
                      '${AppRoutes.servicesView}/${AppRoutes.bookingSummaryView}',
                      extra: widget.listing,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDateFrom() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _dateFromController.text = _dateFormatter.format(picked);
      setState(() {});
    }
  }

  void _selectDateTo() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _dateToController.text = _dateFormatter.format(picked);
      setState(() {});
    }
  }
}
