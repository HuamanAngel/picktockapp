class Picto {
  final String titulo;
  final String imagenURL;
  final int id;
  final String creacion;

  Picto({
    required this.titulo,
    required this.imagenURL,
    required this.id,
    required this.creacion
  });
  static Picto fromJson(Map<dynamic, dynamic> json) {
    return Picto(
      titulo: json["name"],
      imagenURL: json["capital"],
      id: json["id"],
      creacion: json["created_at"],
    );
  }

}
