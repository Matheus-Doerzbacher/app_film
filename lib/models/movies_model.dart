class Movies {
  late final double averageRating;
  late final String backdropPath;
  late final CreateBy createdBy;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<Movie> listMovies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  Movies({
    required this.averageRating,
    required this.backdropPath,
    required this.createdBy,
    required this.description,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.listMovies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    averageRating = json["average_rating"];
    backdropPath = json["backdrop_path"];
    createdBy = CreateBy.fromJson(json["created_by"]);
    description = json["description"];
    id = json["id"];
    iso_3166_1 = json["iso_3166_1"];
    iso_639_1 = json["iso_639_1"];
    name = json["name"];
    page = json["page"];
    posterPath = json["poster_path"];
    public = json["public"];
    listMovies =
        List.from(json["results"]).map((e) => Movie.fromJson(e)).toList();
    revenue = json["revenue"];
    runtime = json["runtime"];
    sortBy = json["sort_by"];
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["average_rating"] = averageRating;
    data["backdrop_path"] = backdropPath;
    data["created_by"] = createdBy;
    data["description"] = description;
    data["id"] = id;
    data["iso_3166_1"] = iso_3166_1;
    data["iso_639_1"] = iso_639_1;
    data["name"] = name;
    data["page"] = page;
    data["poster_path"] = posterPath;
    data["public"] = public;
    data["results"] = listMovies.map((e) => e.toJson()).toList();
    data["revenue"] = revenue;
    data["runtime"] = runtime;
    data["sort_by"] = sortBy;
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class CreateBy {
  late final String gravatarHash;
  late final String id;
  late final String name;
  late final String username;

  CreateBy({
    required this.gravatarHash,
    required this.id,
    required this.name,
    required this.username,
  });

  CreateBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json["gravatar_hash"];
    id = json["id"];
    name = json["name"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["gravatar_hash"] = gravatarHash;
    data["id"] = id;
    data["name"] = name;
    data["username"] = username;
    return data;
  }
}

class Movie {
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguague;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguague,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds = List.castFrom<dynamic, int>(json["genre_ids"]);
    id = json["id"];
    mediaType = json["media_type"];
    originalLanguague = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["media_type"] = mediaType;
    data["original_language"] = originalLanguague;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
