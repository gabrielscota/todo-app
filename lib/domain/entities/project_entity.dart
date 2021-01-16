import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ProjectEntity extends Equatable {
  final String id;
  final String name;
  final String color;

  List get props => [id, name, color];

  ProjectEntity({
    @required this.id,
    @required this.name,
    @required this.color,
  });
}
