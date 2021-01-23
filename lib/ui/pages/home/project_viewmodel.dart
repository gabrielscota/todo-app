import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ProjectViewModel extends Equatable {
  final String id;
  final String name;
  final String color;

  List get props => [id, name, color];

  const ProjectViewModel({
    @required this.id,
    @required this.name,
    @required this.color,
  });
}
