// ignore_for_file: public_member_api_docs, sort_constructors_first
class playlistEntity {
  final String name;
  final String id;
  final String images;
  final String downloadUrl;
  final String primaryArtists;
  final Map more_info;
  playlistEntity({
    required this.name,
    required this.id,
    required this.images,
    required this.downloadUrl,
    required this.primaryArtists,
    required this.more_info
  });
}
