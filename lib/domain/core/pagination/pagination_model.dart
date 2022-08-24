class PaginationModel<T> {
  int nextPage;
  List<T> list;
  int maxPage;

  PaginationModel({
    required this.nextPage,
    required this.list,
    required this.maxPage,
  });
}
