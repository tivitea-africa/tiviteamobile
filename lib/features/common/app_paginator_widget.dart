import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/models/paginator_selector_model.dart';

class AppPaginatorWidget extends StatelessWidget {
  final PaginatorSelectorModel paginatorSelectorModel;
  final void Function(int) onPageChanged;
  const AppPaginatorWidget({
    super.key,
    required this.paginatorSelectorModel,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Showing ${paginatorSelectorModel.itemsPerPage} of ${paginatorSelectorModel.totalItems}',
          style: context.theme.textTheme.labelSmall
              ?.copyWith(color: const Color(0xFF8B909A)),
        ),
        _PageSelector(
          paginatorSelectorModel: paginatorSelectorModel,
          onPageChanged: onPageChanged,
        ),
      ],
    );
  }
}

class _PageSelector extends StatelessWidget {
  final PaginatorSelectorModel paginatorSelectorModel;
  final void Function(int) onPageChanged;
  const _PageSelector({
    required this.paginatorSelectorModel,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _PageContainer(showLeftArrow: true),
        ..._buildPageNumbers(),
        const _PageContainer(showRightArrow: true),
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    const int maxVisiblePages = 5;
    final int totalPages = paginatorSelectorModel.totalPages;
    final int currentPage = paginatorSelectorModel.currentPage;
    final List<Widget> pageNumbers = [];

    if (totalPages <= maxVisiblePages) {
      // If total pages is less than or equal to maxVisiblePages, show all pages
      for (int i = 1; i <= totalPages; i++) {
        pageNumbers.add(_PageContainer(
          pageNumber: i,
          isSelected: i == currentPage,
          onPressed: onPageChanged,
        ));
      }
    } else {
      // Always show first page
      pageNumbers.add(
        _PageContainer(
          pageNumber: 1,
          isSelected: currentPage == 1,
          onPressed: onPageChanged,
        ),
      );

      // Calculate the range of pages to show around current page

      // -3 for first, last, and current page
      const int pagesAroundCurrent = (maxVisiblePages - 3) ~/ 2;
      final bool showLeftEllipsis = currentPage > pagesAroundCurrent + 2;
      final bool showRightEllipsis =
          currentPage < totalPages - (pagesAroundCurrent + 1);

      // Add left ellipsis if needed
      if (showLeftEllipsis) {
        pageNumbers.add(const _PageContainer(isEllipsis: true));
      }

      // Calculate start and end of the middle range
      int rangeStart = currentPage - pagesAroundCurrent;
      int rangeEnd = currentPage + pagesAroundCurrent;

      // Adjust range if too close to edges
      if (!showLeftEllipsis) {
        // Show more pages at start
        rangeEnd = maxVisiblePages - 1;
      }
      if (!showRightEllipsis) {
        rangeStart = totalPages - (maxVisiblePages - 1);
      }

      // Ensure range is within bounds
      rangeStart = rangeStart.clamp(2, totalPages - 1);
      rangeEnd = rangeEnd.clamp(2, totalPages - 1);

      // Add middle range of pages
      for (int i = rangeStart; i <= rangeEnd; i++) {
        pageNumbers.add(_PageContainer(
          pageNumber: i,
          isSelected: i == currentPage,
          onPressed: onPageChanged,
        ));
      }

      // Add right ellipsis if needed
      if (showRightEllipsis) {
        pageNumbers.add(const _PageContainer(isEllipsis: true));
      }

      // Always show last page
      pageNumbers.add(_PageContainer(
        pageNumber: totalPages,
        isSelected: currentPage == totalPages,
        onPressed: onPageChanged,
      ));
    }

    return pageNumbers;
  }
}

class _PageContainer extends StatelessWidget {
  final bool isSelected;
  final int pageNumber;
  final bool showRightArrow;
  final bool showLeftArrow;
  final bool isEllipsis;
  final Function(int)? onPressed;

  const _PageContainer({
    this.isSelected = false,
    this.pageNumber = 1,
    this.showRightArrow = false,
    this.showLeftArrow = false,
    this.isEllipsis = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEllipsis ? null : () => _onPressed(pageNumber),
      child: Container(
        width: 22.w,
        height: 22.h,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: isEllipsis
              ? Colors.transparent
              : isSelected
                  ? const Color(0xFF0F60FF)
                  : const Color(0xFFF1F2F6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: showLeftArrow
              ? const Icon(
                  Icons.arrow_back_ios,
                  size: 10,
                  color: Color(0xFF8B909A),
                )
              : showRightArrow
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Color(0xFF8B909A),
                    )
                  : isEllipsis
                      ? const Text('...')
                      : Text(
                          pageNumber.toString(),
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF8B909A),
                          ),
                        ),
        ),
      ),
    );
  }

  void _onPressed(int page) {
    if (showLeftArrow) {
      onPressed?.call(page - 1);
    } else if (showRightArrow) {
      onPressed?.call(page + 1);
    } else {
      onPressed?.call(page);
    }
  }
}
