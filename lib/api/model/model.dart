class Anime {
  int? currentPage;
  bool? hasNextPage;
  List<Results>? results;

  Anime({this.currentPage, this.hasNextPage, this.results});

  Anime.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['hasNextPage'] = this.hasNextPage;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  int? malId;
  Title? title;
  String? image;
  Trailer? trailer;
  String? description;
  String? status;
  String? cover;
  int? rating;
  int? releaseDate;
  List<String>? genres;
  int? totalEpisodes;
  int? duration;
  String? type;

  Results(
      {this.id,
        this.malId,
        this.title,
        this.image,
        this.trailer,
        this.description,
        this.status,
        this.cover,
        this.rating,
        this.releaseDate,
        this.genres,
        this.totalEpisodes,
        this.duration,
        this.type});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    image = json['image'];
    trailer =
    json['trailer'] != null ? new Trailer.fromJson(json['trailer']) : null;
    description = json['description'];
    status = json['status'];
    cover = json['cover'];
    rating = json['rating'];
    releaseDate = json['releaseDate'];
    genres = json['genres'].cast<String>();
    totalEpisodes = json['totalEpisodes'];
    duration = json['duration'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['malId'] = this.malId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['image'] = this.image;
    if (this.trailer != null) {
      data['trailer'] = this.trailer!.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['cover'] = this.cover;
    data['rating'] = this.rating;
    data['releaseDate'] = this.releaseDate;
    data['genres'] = this.genres;
    data['totalEpisodes'] = this.totalEpisodes;
    data['duration'] = this.duration;
    data['type'] = this.type;
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title({this.romaji, this.english, this.native, this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    data['native'] = this.native;
    data['userPreferred'] = this.userPreferred;
    return data;
  }
}

class Trailer {
  String? id;
  String? site;
  String? thumbnail;

  Trailer({this.id, this.site, this.thumbnail});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    site = json['site'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site'] = this.site;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
