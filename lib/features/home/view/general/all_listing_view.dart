import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/search_text_field.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/view/widgets/secondary_listing_widget.dart';
import 'package:tivi_tea/features/home/view_model/home_notifier.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class AllListingsView extends StatelessWidget {
  const AllListingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.listings,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          right: 10.w,
          bottom: 10.h,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SearchTextField(hintText: context.l10n.search),
                ),
                10.horizontalSpace,
                const FiltersWidget(),
              ],
            ),
          ),
          const CategoryList(),
          const SecondaryListingView(),
        ],
      ),
    );
  }
}

class CategoryList extends ConsumerStatefulWidget {
  const CategoryList({super.key});

  @override
  ConsumerState<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(
      servicesNotiferProvider.select((value) => value.categories),
    );
    final selectedCategory = ref.watch(
      homeNotiferProvider.select((value) => value.selectedCategoryId),
    );
    return Container(
      height: 30.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (ctx, i) => 10.horizontalSpace,
        itemBuilder: (ctx, i) {
          final category = categories[i];
          final bool isSelected = selectedCategory == category.id;
          return GestureDetector(
            onTap: () => _selectCategory(category),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 5.h,
              ),
              child: Text(
                category.name ?? '',
                style: context.theme.textTheme.labelMedium?.copyWith(
                  color: isSelected ? Colors.white : const Color(0xFF737380),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectCategory(CategoryResponseModel category) {
    final notifier = ref.read(homeNotiferProvider.notifier);
    notifier.selectCategory(category.id, onSelected: (id) {});
  }
}
