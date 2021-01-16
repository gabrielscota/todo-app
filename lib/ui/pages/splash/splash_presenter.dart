abstract class SplashPresenter {
  Stream<String> get navigateToStream;

  Future<void> loadTasks({int durationInSeconds});
}
