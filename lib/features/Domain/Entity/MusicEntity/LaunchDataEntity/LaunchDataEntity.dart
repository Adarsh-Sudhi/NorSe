
class launchdataEntity {
   final String id;
   final String image;
   final String albumurl;
   final String suntitle;
   final String title;
   final String type;
  launchdataEntity({
    required this.id,
    required this.image,
    required this.albumurl,
    required this.suntitle,
    required this.title,
    required this.type,
  });


  factory launchdataEntity.fromMap(Map<String, dynamic> map) {
    return launchdataEntity(
      id: map['id'] ?? "null",
      image: map['image'] ?? 'null',
      albumurl: map['albumurl'] ?? 'null',
      suntitle: map['suntitle'] ?? 'null',
      title: map['title'] ?? 'null',
      type: map['type'] ?? 'null',
    );
  }

}
