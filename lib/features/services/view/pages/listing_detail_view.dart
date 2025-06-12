import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/view/widgets/book_now_widget.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class ListingDetailView extends ConsumerStatefulWidget {
  final String listingId;
  const ListingDetailView({super.key, required this.listingId});

  @override
  ConsumerState<ListingDetailView> createState() => _ListingDetailViewState();
}

class _ListingDetailViewState extends ConsumerState<ListingDetailView> {
  ListingResponseModel? listing;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didUpdateWidget(ListingDetailView oldWidget) {
    super.didUpdateWidget(oldWidget);
    init();
  }

  void init() async {
    isLoading = true;
    setState(() {});

    final notifier = ref.read(servicesNotiferProvider.notifier);
    listing = await notifier.getListingbyId(widget.listingId);

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userNotifierProvider);
    final userIsServiceProvider = user.entityType == EntityType.partner;
    final userIsListingOwner = listing?.partner?.user?.id == user.id;

    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final deleteLoadState = ref.watch(partnerServicesNotiferProvider.select(
      (value) => value.deleteListingLoadState,
    ));

    if (listing == null || isLoading == true) {
      return const Center(child: CupertinoActivityIndicator());
    }

    const editListingPath =
        '${AppRoutes.myListingView}/${AppRoutes.editListingView}';
    return AppScaffold(
      appbar: const CustomAppBar(
        showHamburgerMenu: true,
        showBackButtonForHomeScreenAppBar: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListingImagesView(images: listing?.images ?? []),
            ListingDetailDescription(listing: listing!),
            if (listing?.amenities?.isNotEmpty == true)
              AmenitiesRow(amenties: listing?.amenities ?? []),
            30.verticalSpace,
            LocationSection(location: listing?.address ?? ''),
            30.verticalSpace,
            ContactSection(
              phone: listing?.partner?.user?.phoneNumber ?? '',
              email: listing?.partner?.user?.email ?? '',
            ),
            if (userIsServiceProvider && userIsListingOwner)
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  top: 30.h,
                  bottom: 10.h,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: AppButton(
                        buttonText: 'Edit',
                        onPressed: () {
                          if (listing != null) {
                            notifier.selectListing(listing!);
                            context.push(editListingPath);
                          }
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    Flexible(
                      child: AppButton(
                        buttonText: 'Delete',
                        backgroundColor: Colors.red,
                        isLoading: deleteLoadState == LoadState.loading,
                        onPressed: () => notifier.deleteListing(
                          listing?.id ?? '',
                          onSuccess: () => context.pop(),
                          onError: (e) {
                            if (e !=
                                "Null check operator used on a null value") {
                              context.showError(e);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (!userIsServiceProvider) BookNowContainer(listing: listing!),
            if (!userIsServiceProvider) 30.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class ListingDetailDescription extends StatelessWidget {
  final ListingResponseModel listing;
  const ListingDetailDescription({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 18.w) + EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listing.name ?? '',
            style: context.theme.textTheme.titleMedium?.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
          30.verticalSpace,
          Text(
            context.l10n.description,
            style: context.theme.textTheme.displayLarge?.copyWith(
              fontSize: 16.sp,
            ),
          ),
          10.verticalSpace,
          Text(
            listing.description ?? '',
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF737380),
            ),
          ),
        ],
      ),
    );
  }
}

class AmenitiesRow extends StatelessWidget {
  final List<String> amenties;
  const AmenitiesRow({
    super.key,
    required this.amenties,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 18.w) + EdgeInsets.only(top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.facilities,
            style: context.theme.textTheme.displayLarge?.copyWith(
              fontSize: 16.sp,
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              // AppSvgWidget(path: icon),
              // 10.horizontalSpace,
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: amenties.length,
                  separatorBuilder: (ctx, i) => 10.verticalSpace,
                  itemBuilder: (ctx, i) => Text(
                    amenties[i],
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF737380),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListingImagesView extends StatelessWidget {
  final List<String> images;
  final BoxFit? fit;
  const ListingImagesView({
    super.key,
    required this.images,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      width: context.width,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (ctx, i) {
          final imagePath = images[i];
          return AppImageWidget(
            fit: fit,
            imagePath: imagePath,
            borderRadius: BorderRadius.circular(0),
          );
        },
      ),
    );
  }
}

class LocationSection extends StatelessWidget {
  final String location;
  const LocationSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 18.w) + EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.location,
            style: context.theme.textTheme.displayLarge?.copyWith(
              fontSize: 16.sp,
            ),
          ),
          10.verticalSpace,
          Text(
            location,
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF737380),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  final String phone;
  final String email;
  const ContactSection({
    super.key,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w) +
          EdgeInsets.only(
            top: 10.h,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.contact,
            style: context.theme.textTheme.displayLarge?.copyWith(
              fontSize: 16.sp,
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              AppSvgWidget(path: Assets.svgs.callOutgoing),
              10.horizontalSpace,
              Text(
                phone,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF737380),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              AppSvgWidget(path: Assets.svgs.mail),
              10.horizontalSpace,
              Text(
                email,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF737380),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
