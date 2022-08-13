class Picto {
  final String titulo;
  final String imagenURL;
  final int id;
  final String creacion;
  final dynamic picVisibility;
  final dynamic catId;

  int? idPictograma;

  Picto({
    required this.titulo,
    required this.imagenURL,
    required this.id,
    required this.creacion,
    required this.picVisibility,
    this.idPictograma,
    required this.catId,
  });
  static Picto fromJson(Map<dynamic, dynamic> json) {
    return Picto(
        titulo: json["pic_title"],
        imagenURL: json["pic_url_image"],
        id: json["id"],
        creacion: json["created_at"],
        picVisibility: json["pic_visibility"],
        catId: json["cat_id"]);
  }
}
