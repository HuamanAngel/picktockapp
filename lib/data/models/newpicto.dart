class NewPicto{
  // String token;
  late String pic_title;
  late String pic_visibility;
  late String pic_image;
  late String cat_id;
  NewPicto({
    required this.pic_title,
    required this.pic_visibility,
    required this.pic_image,
    required this.cat_id,
  });
  static NewPicto fromJson(Map<dynamic, dynamic> json) {
    return NewPicto(
      pic_title: json['pic_title'],
      pic_visibility: json['pic_visibility'],
      // token: json['token'],
      pic_image: json['pic_image'],
      cat_id: json['cat_id'],
    );
  }
}
