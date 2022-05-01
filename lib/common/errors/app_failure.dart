class AppFailure implements Exception {
  final String title;
  final String? message;

  AppFailure(
    this.title, {
    this.message,
  });
}
