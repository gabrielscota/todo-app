import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class TaskViewModel extends Equatable {
  final String id;
  final String title;
  final String date;
  final bool checked;

  List get props => [id, title, date, checked];

  TaskViewModel({
    @required this.id,
    @required this.title,
    this.date,
    this.checked = false,
  });
}
