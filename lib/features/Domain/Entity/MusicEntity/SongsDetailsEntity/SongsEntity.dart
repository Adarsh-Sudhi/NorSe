// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AlbumElements extends Equatable {
   final String id;
   final String name;
   final String year;
   final String type;
   final String language;
   final String Artist;
   final String url;
   final String image;
  AlbumElements({
    required this.id,
    required this.name,
    required this.year,
    required this.type,
    required this.language,
    required this.Artist,
    required this.url,
    required this.image,
  });
    
      @override
    List<Object?> get props => [
        id,name,year,language,Artist,url,image
      ];
    

}

