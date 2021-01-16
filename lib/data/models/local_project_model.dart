import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class LocalProjectModel {
  final String id;
  final String name;
  final String color;

  LocalProjectModel({
    @required this.id,
    @required this.name,
    @required this.color,
  });

  factory LocalProjectModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'name', 'color'])) {
      throw Exception();
    }
    return LocalProjectModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }

  factory LocalProjectModel.fromEntity(ProjectEntity entity) =>
      LocalProjectModel(
        id: entity.id,
        name: entity.name,
        color: entity.color,
      );

  ProjectEntity toEntity() => ProjectEntity(
        id: id,
        name: name,
        color: color,
      );

  Map<String, String> toJson() => {
        'id': id,
        'name': name,
        'color': color,
      };
}
