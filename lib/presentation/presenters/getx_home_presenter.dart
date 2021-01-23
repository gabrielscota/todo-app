import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  final _tasks = Rx<List<TaskViewModel>>();
  final _projects = Rx<List<ProjectViewModel>>();

  Stream<List<TaskViewModel>> get tasksStream => _tasks.stream;
  Stream<List<ProjectViewModel>> get projectsStream => _projects.stream;

  Future<void> loadTasksData() async {
    try {
      final tasks = await loadTasks.load();
      _tasks.value = tasks
          .map((task) => TaskViewModel(
                id: task.id,
                title: task.title,
                date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                    .format(task.date),
                checked: task.checked,
              ))
          .toList();
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> loadProjectsData() async {
    try {
      final projects = await loadProjects.load();
      _projects.value = projects
          .map((project) => ProjectViewModel(
                id: project.id,
                name: project.name,
                color: project.color,
              ))
          .toList();
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> saveTask(String task) async {
    try {
      if (_tasks.value == null) {
        final List<TaskViewModel> tasks = [];
        tasks.add(TaskViewModel(id: '1', title: task));
        _tasks.subject.add(tasks);
      } else {
        final tasks = _tasks.subject.value;
        tasks.add(TaskViewModel(id: '1', title: task));
        _tasks.subject.add(tasks);
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  void goToTask(String taskId) {
    navigateTo = '/task/$taskId';
  }
}
