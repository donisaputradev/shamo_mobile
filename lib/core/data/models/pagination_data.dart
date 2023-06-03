class PaginationData<T> {
  // List of data items
  final List<T> data;
  // Current page number
  final int currentPage;
  // Last page number
  final int lastPage;

  PaginationData({
    required this.data,
    required this.currentPage,
    required this.lastPage,
  });

  factory PaginationData.fromJson(
    Map<String, dynamic> json,
    Function fromJsonT,
  ) {
    // Temporary list to store data items
    List<T> datas = [];

    if (json['data'] != null) {
      json['data'].forEach((data) {
        // Add each data item to the list
        datas.add(fromJsonT(data));
      });
    }

    return PaginationData(
      // Assign the list of data items
      data: datas,
      // Assign the last page number, default to 0 if not available
      lastPage: json['last_page'] ?? 0,
      // Assign the current page number, default to 0 if not available
      currentPage: json['current_page'] ?? 0,
    );
  }
}
