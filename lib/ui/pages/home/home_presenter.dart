import './project_viewmodel.dart';
import './task_viewmodel.dart';

abstract class HomePresenter {
  Stream<List<TaskViewModel>> get tasksStream;
  Stream<List<ProjectViewModel>> get projectsStream;
  Stream<String> get navigateToStream;

  Future<void> loadTasksData();
  Future<void> loadProjectsData();
  Future<void> saveTask(String task);
  void goToTask(String taskId);
}
