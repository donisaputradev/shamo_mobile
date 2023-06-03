extension ImageUrlExtension on String {
  String get baseImage {
    const baseUrl = 'https://shamo.donisaputra.com/storage/';
    return '$baseUrl$this';
  }
}
