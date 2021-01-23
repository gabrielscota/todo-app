import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import './models.dart';

class LocalTaskModel {
  final String id;
  final String title;
  final LocalProjectModel project;
  final DateTime date;
  final String note;
  final List<LocalSubTaskModel> subTasks;
  final bool checked;

  LocalTaskModel({
    @required this.id,
    @required this.title,
    @required this.project,
    this.date,
    this.note,
    this.subTasks,
    this.checked = false,
  });

  factory LocalTaskModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'project', 'checked'])) {
      throw Exception();
    }
    return LocalTaskModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      project: json['project'] as LocalProjectModel ??
          json['project'] as LocalProjectModel,
      date: DateTime.parse(json['date'].toString()),
      note: json['note'].toString(),
      subTasks: json['subTasks'] as List<LocalSubTaskModel> ??
          json['subTasks']
              .map<LocalSubTaskModel>(
                  (subTaskJson) => LocalTaskModel.fromJson(subTaskJson as Map))
              .toList() as List<LocalSubTaskModel>,
      checked: json['checked'].toLowerCase() == 'true',
    );
  }

  factory LocalTaskModel.fromEntity(TaskEntity entity) => LocalTaskModel(
        id: entity.id,
        title: entity.title,
        project: LocalProjectModel.fromEntity(entity.project),
        date: entity.date,
        note: entity.note,
        subTasks: entity.subTasks
            .map<LocalSubTaskModel>(
                (subTask) => LocalSubTaskModel.fromEntity(subTask))
            .toList(),
        checked: entity.checked,
      );

  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        project: project.toEntity(),
        date: date,
        note: note,
        subTasks: subTasks
            .map<SubTaskEntity>((subTask) => subTask.toEntity())
            .toList(),
        checked: checked,
      );

  Map toJson() => {
        'id': id,
        'title': title,
        'project': project.toJson(),
        'date': date.toIso8601String(),
        'note': note,
        'subTasks': subTasks.map<Map>((subTask) => subTask.toJson()).toList(),
        'checked': checked.toString(),
      };
}
