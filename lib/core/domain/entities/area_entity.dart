import 'package:equatable/equatable.dart';

class AreaEntity extends Equatable {
  AreaEntity({
    required this.id,
    required this.descArea,
  });

  final int id;
  final String descArea;

  @override
  String toString() => 'AreaEntity(orgAreaId: $id, descArea: $descArea)';

  @override
  List<Object?> get props => [this.id, this.descArea];
}
