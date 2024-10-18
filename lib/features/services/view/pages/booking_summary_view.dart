import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view/widgets/listing_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingSummaryView extends StatefulWidget {
  final ListingResponseModel listing;
  const BookingSummaryView({super.key, required this.listing});

  @override
  State<BookingSummaryView> createState() => _BookingSummaryViewState();
}

class _BookingSummaryViewState extends State<BookingSummaryView> {
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: DottedWidget(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(context.l10n.pickUpDate),
                          Text(context.l10n.pickUpDate),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: DottedWidget(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: context.width,
                    ),
                  ),
                ),
                Flexible(
                  child: DottedWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(context.l10n.pickUpDate),
                          Text(context.l10n.pickUpDate),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: DottedWidget(
              child: SizedBox(
                height: 50.h,
                width: context.width,
              ),
            ),
          ),
          50.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: AppButton(buttonText: context.l10n.payNow, onPressed: () {}
                //  context.push(
                //   '${AppRoutes.servicesView}/${AppRoutes.bookingSummaryView}',
                //   extra: widget.listing,
                // ),
                ),
          ),
        ],
      ),
    );
  }
}

class DottedWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const DottedWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(2),
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(15),
      padding: padding,
      color: const Color(0xFF9D9DAA).withOpacity(0.5),
      dashPattern: const [5, 2],
      child: child,
    );
  }
}
