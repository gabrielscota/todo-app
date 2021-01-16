import '../entities/entities.dart';

abstract class LoadTasks {
  Future<List<TaskEntity>> load();
}
