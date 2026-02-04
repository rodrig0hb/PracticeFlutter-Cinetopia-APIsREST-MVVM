import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String imageUrl;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.imageUrl,
  });

  String getPosterImage () {
    return imageUrlPrefix + imageUrl;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'overview': overview,
      'imageUrl': imageUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
      imageUrl: map['poster_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
