class AudioStreamsInfoEntity {

  final String url;
  final Map containername;
  final Map sizekilobytes;
  final String audioCodecc;
  final Map bitrate;


  AudioStreamsInfoEntity({
    required this.url,
    required this.containername,
    required this.sizekilobytes,
    required this.audioCodecc,
    required this.bitrate,
  });
}
