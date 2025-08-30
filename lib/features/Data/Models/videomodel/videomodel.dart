
class VideoModel {
  final String title;
  final Duration duration;
  final String? thumbnail; // For storing thumbnail image bytes
  final String path;

  VideoModel({
    required this.title,
    required this.duration,
    required this.path,
    this.thumbnail,
  });
}
