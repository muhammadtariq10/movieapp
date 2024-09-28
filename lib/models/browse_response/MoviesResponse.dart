class MoviesResponse {
  List<Genres>? genres;

  MoviesResponse({this.genres});

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  String? imagePath;

  Genres({this.id, this.name, this.imagePath});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = getImagePathForCategory(name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_path'] = imagePath;
    return data;
  }
}

String getImagePathForCategory(String? categoryName) {
  switch (categoryName) {
    case 'Action':
      return 'assets/images/actionmovie.jpg';
    case 'Comedy':
      return 'assets/images/comedy.jpg';
    case 'Documentary':
      return 'assets/images/documentry.jpg';
    case 'Animation':
      return 'assets/images/animation.jpg';
    case 'Drama':
      return 'assets/images/drama.jpg';
    case 'Adventure':
      return 'assets/images/adventure.jpg';
    case 'Family':
      return 'assets/images/family.jpg';
    case 'Fantasy':
      return 'assets/images/fantasy.jpg';
    case 'Horror':
      return 'assets/images/horror.jpg';
    case 'Music':
      return 'assets/images/music.jpg';
    case 'Romance':
      return 'assets/images/romance.jpg';
    case 'Science Fiction':
      return 'assets/images/science_fiction.jpg';
    case 'Crime':
      return 'assets/images/crime.jpg';
    case 'TV Movie':
      return 'assets/images/tv.jpg';
    case 'War':
      return 'assets/images/War.jpg';
    default:
      return 'assets/images/Mystery.jpg';
  }
}
