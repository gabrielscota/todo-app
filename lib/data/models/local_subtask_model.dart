import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class LocalSubTaskModel {
  final String id;
  final String title;
  final bool checked;

  LocalSubTaskModel({
    @required this.id,
    @required this.title,
    @required this.checked,
  });

  factory LocalSubTaskModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'checked'])) {
      throw Exception();
    }
    return LocalSubTaskModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      checked: json['checked'] as bool,
    );
  }

  factory LocalSubTaskModel.fromEntity(SubTaskEntity entity) =>
      LocalSubTaskModel(
        id: entity.id,
        title: entity.title,
        checked: entity.checked,
      );

  SubTaskEntity toEntity() => SubTaskEntity(
        id: id,
        title: title,
        checked: checked,
      );

  Map<String, String> toJson() => {
        'id': id,
        'title': title,
        'checked': checked.toString(),
      };
}
