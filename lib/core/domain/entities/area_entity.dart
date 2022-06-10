import 'package:equatable/equatable.dart';

class AreaEntity extends Equatable {
  AreaEntity({
    required this.orgAreaId,
    required this.descArea,
  });

  final int orgAreaId;
  final String descArea;

  @override
  String toString() => 'AreaEntity(orgAreaId: $orgAreaId, descArea: $descArea)';

  @override
  List<Object?> get props => [this.orgAreaId, this.descArea];
}
