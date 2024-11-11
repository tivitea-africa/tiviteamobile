import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/date_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/widgets/listing_widget.dart';
import 'package:tivi_tea/features/services/view_model/booking_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingSummaryView extends StatefulWidget {
  final BookingSummaryParams params;
  const BookingSummaryView({super.key, required this.params});

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
          WorkSpaceWidget(listing: widget.params.listing),
          50.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: DottedWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 10.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            context.l10n.pickUpDate,
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              fontSize: 13.sp,
                              color: const Color(0xFF737380),
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            widget.params.selectedDateFrom.toMonthDate,
                            textAlign: TextAlign.center,
                            style:
                                context.theme.textTheme.displaySmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
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
                      vertical: 12.h,
                      horizontal: 10.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            context.l10n.returnDate,
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              fontSize: 13.sp,
                              color: const Color(0xFF737380),
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            widget.params.selectedDateTo.toMonthDate,
                            textAlign: TextAlign.center,
                            style:
                                context.theme.textTheme.displaySmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
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
                width: context.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      AppSvgWidget(
                        path: Assets.svgs.location,
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.pickUpLocation,
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              fontSize: 13.sp,
                              color: const Color(0xFF737380),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            widget.params.listing.address ?? '',
                            textAlign: TextAlign.center,
                            style:
                                context.theme.textTheme.displaySmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          50.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Consumer(
              builder: (context, ref, _) {
                final loadState = ref.watch(bookingNotiferProvider.select(
                  (value) => value.loadState,
                ));
                return AppButton(
                  isLoading: loadState == LoadState.loading,
                  buttonText: context.l10n.continue_,
                  onPressed: () => _submit(ref),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _submit(WidgetRef ref) async {
    final notifier = ref.watch(bookingNotiferProvider.notifier);
    if (widget.params.listing.listingType?.enumType ==
        CreateListingType.workSpace) {
      final data = BookWorkSpaceModel(
        pickUpDate: widget.params.selectedDateFrom,
        returnDate: widget.params.selectedDateTo,
        numOfPeople: widget.params.numOfPeople,
        subListingId: widget.params.roomId,
      );
      notifier.bookWorkSpace(
        listingId: widget.params.listing.id ?? '',
        data: data,
        onSuccess: () {},
        onError: (message) {},
      );
    } else {
      final data = BookWorkToolModel(
        pickUpDate: widget.params.selectedDateFrom,
        returnDate: widget.params.selectedDateTo,
      );
      notifier.bookWorktool(
        listingId: widget.params.listing.id ?? '',
        data: data,
        onSuccess: () {},
        onError: (message) {},
      );
    }
  }
}

class DottedWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  const DottedWidget({
    super.key,
    required this.child,
    this.radius = 15,
    this.padding = const EdgeInsets.all(2),
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(radius),
      padding: padding,
      color: const Color(0xFF9D9DAA).withOpacity(0.5),
      dashPattern: const [5, 2],
      child: child,
    );
  }
}
