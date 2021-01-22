import './task_viewmodel.dart';
import './project_viewmodel.dart';

abstract class HomePresenter {
  Stream<List<TaskViewModel>> tasksStream;
  Stream<List<ProjectViewModel>> projectsStream;
  Stream<String> get navigateToStream;

  Future<void> loadTasksData();
  Future<void> loadProjectsData();
  void goToTask(String taskId);
}
