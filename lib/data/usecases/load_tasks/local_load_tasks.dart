import 'package:meta/meta.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';
import '../../models/models.dart';

class LocalLoadTasks implements LoadTasks {
  final CacheStorage cacheStorage;

  LocalLoadTasks({@required this.cacheStorage});

  Future<List<TaskEntity>> load() async {
    try {
      final data = await cacheStorage.fetch('tasks');
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
      final data = await cacheStorage.fetch('tasks');
      _mapToEntity(data);
    } catch (error) {
      await cacheStorage.delete('tasks');
    }
  }

  Future<void> save(List<TaskEntity> tasks) async {
    try {
      await cacheStorage.save(key: 'tasks', value: _mapToJson(tasks));
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  List<TaskEntity> _mapToEntity(dynamic list) => list
      .map<TaskEntity>(
          (json) => LocalTaskModel.fromJson(json as Map).toEntity())
      .toList() as List<TaskEntity>;

  List<Map> _mapToJson(List<TaskEntity> list) =>
      list.map((entity) => LocalTaskModel.fromEntity(entity).toJson()).toList();
}
