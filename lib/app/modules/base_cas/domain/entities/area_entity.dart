class Area {
  Area({
    required this.id,
    required this.descArea,
    required this.orgUnidadId,
    required this.organigrama,
  });

  final int id;
  final String descArea;
  final int orgUnidadId;
  final String organigrama;

  Area copyWith({
    int? id,
    String? descArea,
    int? orgUnidadId,
    String? organigrama,
  }) =>
      Area(
        id: id ?? this.id,
        descArea: descArea ?? this.descArea,
        orgUnidadId: orgUnidadId ?? this.orgUnidadId,
        organigrama: organigrama ?? this.organigrama,
      );

  factory Area.fromMap(Map<String, dynamic> json) => Area(
        id: json["id"],
        descArea: json["desc_area"],
        orgUnidadId: json["org_unidad_id"],
        organigrama: json["organigrama"] == null ? null : json["organigrama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "desc_area": descArea,
        "org_unidad_id": orgUnidadId,
        "organigrama": organigrama,
      };
}
