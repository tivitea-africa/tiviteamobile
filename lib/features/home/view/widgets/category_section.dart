import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/view/widgets/listing_widget.dart';
import 'package:tivi_tea/features/home/view_model/home_notifier.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ViewAllRow(),
        Categories(),
        ListingsView(),
      ],
    );
  }
}

class _ViewAllRow extends StatelessWidget {
  const _ViewAllRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.category,
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          Text(
            context.l10n.viewAll,
            style: context.theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(
      servicesNotiferProvider.select((value) => value.categories),
    );
    final selectedCategory = ref.watch(
      homeNotiferProvider.select((value) => value.selectedCategoryId),
    );
    return Padding(
      padding: EdgeInsets.only(left: 18.w, top: 10.h),
      child: SizedBox(
        height: 25.h,
        width: context.width,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (ctx, i) => 10.horizontalSpace,
          itemBuilder: (ctx, i) {
            final category = categories[i];
            final bool isSelected = selectedCategory == category.id;
            return GestureDetector(
              onTap: () => _selectCategory(category),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.theme.primaryColor
                      : context.theme.primaryColorLight,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  child: Text(
                    category.name ?? '',
                    style: context.theme.textTheme.labelMedium?.copyWith(
                      color:
                          isSelected ? Colors.white : const Color(0xFF737380),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _selectCategory(CategoryResponseModel category) {
    final notifier = ref.read(homeNotiferProvider.notifier);
    notifier.selectCategory(category.id, onSelected: (id) {});
  }
}
