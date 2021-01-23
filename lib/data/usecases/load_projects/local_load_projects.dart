import 'package:meta/meta.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';
import '../../models/models.dart';

class LocalLoadProjects implements LoadProjects {
  final CacheStorage cacheStorage;

  LocalLoadProjects({@required this.cacheStorage});

  Future<List<ProjectEntity>> load() async {
    try {
      final data = await cacheStorage.fetch('projects');
      if (data?.isEmpty != false) {
        throw Exception();
      }
      return _mapToEntity(data);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  Future<void> validate() async {
    try {
      final data = await cacheStorage.fetch('projects');
      _mapToEntity(data);
    } catch (error) {
      await cacheStorage.delete('projects');
    }
  }

  Future<void> save(List<ProjectEntity> projects) async {
    try {
      await cacheStorage.save(key: 'projects', value: _mapToJson(projects));
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  List<ProjectEntity> _mapToEntity(dynamic list) => list
      .map<ProjectEntity>((json) => LocalProjectModel.fromJson(json as Map).toEntity())
      .toList() as List<ProjectEntity>;

  List<Map> _mapToJson(List<ProjectEntity> list) => list
      .map((entity) => LocalProjectModel.fromEntity(entity).toJson())
      .toList();
}
