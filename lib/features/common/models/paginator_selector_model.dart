class PaginatorSelectorModel {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int? itemsPerPage;

  PaginatorSelectorModel({
    this.currentPage = 1,
    required this.totalPages,
    required this.totalItems,
    this.itemsPerPage,
  });
}