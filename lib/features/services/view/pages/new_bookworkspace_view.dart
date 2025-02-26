import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/widgets/booking_step_1.dart';
import 'package:tivi_tea/features/services/view/widgets/booking_step_2.dart';
import 'package:tivi_tea/features/services/view/widgets/booking_step_3.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_stepper.dart';

class NewBookWorkspaceOrListingView extends StatefulWidget {
  final ListingResponseModel listing;
  const NewBookWorkspaceOrListingView({super.key, required this.listing});

  @override
  State<NewBookWorkspaceOrListingView> createState() =>
      _NewBookWorkspaceOrListingViewState();
}

class _NewBookWorkspaceOrListingViewState
    extends State<NewBookWorkspaceOrListingView> {
  int currentStep = 1;
  final totalSteps = 3;
  late List<String> stepTitles;

  BookingSummaryParams? params;
  Room? selectedRoom;

  @override
  void initState() {
    super.initState();
    final isWorkspace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;

    stepTitles = [
      isWorkspace ? 'Start Booking' : 'Start Renting',
      isWorkspace ? 'Choose a package' : 'Pickup Location',
      'Checkout',
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isWorkspace =
        widget.listing.listingType?.enumType == CreateListingType.workSpace;
    return AppScaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appbar: CustomAppBar(
        color: const Color(0xFFF5F5F5),
        title: isWorkspace ? 'Start Booking' : 'Start Renting',
        //onHomeBackButtonTap: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18) +
                  const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomStepper(
                    currentStep: currentStep,
                    totalSteps: totalSteps,
                    stepTitles: stepTitles,
                    onTapStep: (step) {
                      if (step > currentStep) return;
                      currentStep = step;
                      setState(() {});
                    },
                  ),
                  20.verticalSpace,
                  switch (currentStep) {
                    1 => BookingStep1(
                        title: stepTitles[currentStep - 1],
                        listing: widget.listing,
                        moveToNextStep: (p) {
                          currentStep++;
                          params = p;
                          setState(() {});
                        },
                      ),
                    2 => BookingStep2(
                        params: ChooseRoomViewParams(
                          bookingSummaryParams: params,
                          rooms: widget.listing.rooms ?? [],
                        ),
                        onRoomSelected: (room) {
                          currentStep++;
                          selectedRoom = room;
                          setState(() {});
                        },
                      ),
                    3 => BookingStep3(
                        room: selectedRoom,
                        listing: widget.listing,
                        naviagte: _navigate,
                      ),
                    _ => throw ''
                  }
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate() {
    context.push(
      '${AppRoutes.servicesView}/${AppRoutes.bookingSummaryView}',
      extra: params,
    );
  }
}
