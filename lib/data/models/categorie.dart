class Categorie {
  final int id;
  final String titulo;
  final String imagen;
  final String creacion;

  Categorie({
    required this.id,
    required this.titulo,
    required this.imagen,
    required this.creacion,
  });

  static Categorie fromJson(Map<dynamic, dynamic> json) {
    return Categorie(
      id: json["id"],
      titulo: json["titulo"],
      imagen: json["imagen"],
      creacion: json["creacion"],
    );
  }
}
