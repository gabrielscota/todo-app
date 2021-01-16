import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController
    with NavigationManager
    implements SplashPresenter {
  final LoadTasks loadLocalTasks;

  GetxSplashPresenter({@required this.loadLocalTasks});

  Future<void> loadTasks({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      await loadLocalTasks.load();
      navigateTo = '/home';
    } catch (error) {
      navigateTo = '/home';
    }
  }
}
