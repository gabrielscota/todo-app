import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import './entities.dart';

class TaskEntity extends Equatable {
  final String id;
  final ProjectEntity project;
  final DateTime date;
  final String note;
  final List<SubTaskEntity> subTasks;
  final bool checked;

  List get props => [id, project, date, note, subTasks, checked];

  TaskEntity({
    @required this.id,
    @required this.project,
    this.date,
    this.note,
    this.subTasks,
    this.checked = false,
  });
}
