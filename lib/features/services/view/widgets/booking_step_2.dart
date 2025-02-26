import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view/pages/choose_room_view.dart';

class BookingStep2 extends StatelessWidget {
  final ChooseRoomViewParams params;
  final void Function(Room) onRoomSelected;
  const BookingStep2({
    super.key,
    required this.params,
    required this.onRoomSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Text(
            'Choose a package',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 22,
              color: context.theme.primaryColor,
            ),
          ),
          10.verticalSpace,
          Text(
            params.bookingSummaryParams?.listing.name ?? '',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              color: const Color(0xFF737380).withOpacity(0.6),
            ),
          ),
          Text(
            params.bookingSummaryParams?.listing.address ?? '',
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 11,
              color: const Color(0xFF737380).withOpacity(0.6),
            ),
          ),
          15.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemCount: params.rooms.length,
              itemBuilder: (ctx, i) => RoomListingWidget(
                room: params.rooms[i],
                onRoomSelected: onRoomSelected,
              ),
            ),
          )
        ],
      ),
    );
  }
}
