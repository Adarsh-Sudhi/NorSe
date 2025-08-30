class SearchEntity{
    final String id;
    final String name;
    final String year;
    final String image;
    final String primaryArtists;
    final String downloadUrl;
    final Map<dynamic,dynamic> moreinfo;
    
  SearchEntity({
    required this.id,
    required this.name,
    required this.year,
    required this.image,
    required this.primaryArtists,
    required this.downloadUrl,
    required this.moreinfo
  });
}
