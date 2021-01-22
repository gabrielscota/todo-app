import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxHomePresenter extends GetxController
    with NavigationManager
    implements HomePresenter {
  final LoadTasks loadTasks;
  final LoadProjects loadProjects;

  GetxHomePresenter({
    @required this.loadTasks,
    @required this.loadProjects,
  });

  Stream<List<ProjectViewModel>> projectsStream;
  Stream<List<TaskViewModel>> tasksStream;

  @override
  Future<void> loadProjectsData() async {}

  @override
  Future<void> loadTasksData() async {}

  void goToTask(String taskId) {
    navigateTo = '/task/$taskId';
  }
}
