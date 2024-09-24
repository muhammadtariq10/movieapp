class MovieResponceDetails {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieResponceDetails(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieResponceDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? new BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    if (this.belongsToCollection != null) {
      data['belongs_to_collection'] = this.belongsToCollection!.toJson();
    }
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}


// import 'production_country.dart';

// class MovieResponce {
//   final bool? adult;
//   final dynamic backdropPath;
//   final dynamic belongsToCollection;
//   final int? budget;
//   final List<dynamic>? genres;
//   final String? homepage;
//   final int? id;
//   final dynamic imdbId;
//   final List<String>? originCountry;
//   final String? originalLanguage;
//   final String? originalTitle;
//   final String? overview;
//   final double? popularity;
//   final String? posterPath;
//   final List<dynamic>? productionCompanies;
//   final List<ProductionCountry>? productionCountries;
//   final String? releaseDate;
//   final int? revenue;
//   final int? runtime;
//   final List<dynamic>? spokenLanguages;
//   final String? status;
//   final String? tagline;
//   final String? title;
//   final bool? video;
//   final int? voteAverage;
//   final int? voteCount;

//   const MovieResponce({
//     this.adult,
//     this.backdropPath,
//     this.belongsToCollection,
//     this.budget,
//     this.genres,
//     this.homepage,
//     this.id,
//     this.imdbId,
//     this.originCountry,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.productionCompanies,
//     this.productionCountries,
//     this.releaseDate,
//     this.revenue,
//     this.runtime,
//     this.spokenLanguages,
//     this.status,
//     this.tagline,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//   });

//   factory MovieResponce.fromJson(Map<String, dynamic> json) => MovieResponce(
//         adult: json['adult'] as bool?,
//         backdropPath: json['backdrop_path'] as dynamic,
//         belongsToCollection: json['belongs_to_collection'] as dynamic,
//         budget: json['budget'] as int?,
//         genres: json['genres'] as List<dynamic>?,
//         homepage: json['homepage'] as String?,
//         id: json['id'] as int?,
//         imdbId: json['imdb_id'] as dynamic,
//         originCountry: json['origin_country'] as List<String>?,
//         originalLanguage: json['original_language'] as String?,
//         originalTitle: json['original_title'] as String?,
//         overview: json['overview'] as String?,
//         popularity: (json['popularity'] as num?)?.toDouble(),
//         posterPath: json['poster_path'] as String?,
//         productionCompanies: json['production_companies'] as List<dynamic>?,
//         productionCountries: (json['production_countries'] as List<dynamic>?)
//             ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         releaseDate: json['release_date'] as String?,
//         revenue: json['revenue'] as int?,
//         runtime: json['runtime'] as int?,
//         spokenLanguages: json['spoken_languages'] as List<dynamic>?,
//         status: json['status'] as String?,
//         tagline: json['tagline'] as String?,
//         title: json['title'] as String?,
//         video: json['video'] as bool?,
//         voteAverage: json['vote_average'] as int?,
//         voteCount: json['vote_count'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'adult': adult,
//         'backdrop_path': backdropPath,
//         'belongs_to_collection': belongsToCollection,
//         'budget': budget,
//         'genres': genres,
//         'homepage': homepage,
//         'id': id,
//         'imdb_id': imdbId,
//         'origin_country': originCountry,
//         'original_language': originalLanguage,
//         'original_title': originalTitle,
//         'overview': overview,
//         'popularity': popularity,
//         'poster_path': posterPath,
//         'production_companies': productionCompanies,
//         'production_countries':
//             productionCountries?.map((e) => e.toJson()).toList(),
//         'release_date': releaseDate,
//         'revenue': revenue,
//         'runtime': runtime,
//         'spoken_languages': spokenLanguages,
//         'status': status,
//         'tagline': tagline,
//         'title': title,
//         'video': video,
//         'vote_average': voteAverage,
//         'vote_count': voteCount,
//       };
// }
