import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SubTaskEntity extends Equatable {
  final String id;
  final String title;
  final bool checked;

  List get props => [id, title, checked];

  const SubTaskEntity({
    @required this.id,
    @required this.title,
    @required this.checked,
  });
}
