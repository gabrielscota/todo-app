import '../entities/entities.dart';

abstract class LoadProjects {
  Future<List<ProjectEntity>> load();
}
