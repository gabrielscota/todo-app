import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TaskEntity extends Equatable {
  final String id;
  final ProjectEntity project;
  final DateTime date;
  final String note;
  final List<SubTaskEntity> subTasks;

  List get props => [id, project, date];

  TaskEntity({
    @required this.id,
    @required this.project,
    this.date,
    this.note,
    this.subTasks,
  });
}
