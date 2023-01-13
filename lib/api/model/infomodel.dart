class AnimeInfo {
  String? id;
  Title? title;
  bool? isAdult;
  String? countryOfOrigin;
  String? image;
  String? cover;
  String? description;
  String? status;
  int? releaseDate;
  StartDate? startDate;
  StartDate? endDate;
  StartDate? nextAiringEpisode;
  int? totalEpisodes;
  int? rating;
  int? duration;
  List<String>? genres;
  String? type;
  List<Recommendations>? recommendations;
  List<Relations>? relations;
  List<Episodes>? episodes;

  AnimeInfo(
      {this.id,
        this.title,
        this.isAdult,
        this.countryOfOrigin,
        this.image,
        this.cover,
        this.description,
        this.status,
        this.releaseDate,
        this.startDate,
        this.endDate,
        this.nextAiringEpisode,
        this.totalEpisodes,
        this.rating,
        this.duration,
        this.genres,
        this.type,
        this.recommendations,
        this.relations,
        this.episodes});

  AnimeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    isAdult = json['isAdult'];
    countryOfOrigin = json['countryOfOrigin'];
    image = json['image'];
    cover = json['cover'];
    description = json['description'];
    status = json['status'];
    releaseDate = json['releaseDate'];
    startDate = json['startDate'] != null
        ?  StartDate.fromJson(json['startDate'])
        : null;
    endDate = json['endDate'] != null
        ?  StartDate.fromJson(json['endDate'])
        : null;
    nextAiringEpisode = json['nextAiringEpisode'] != null
        ?  StartDate.fromJson(json['nextAiringEpisode'])
        : null;
    totalEpisodes = json['totalEpisodes'];
    rating = json['rating'];
    duration = json['duration'];
    genres = json['genres'].cast<String>();
    type = json['type'];
    if (true) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add( Recommendations.fromJson(v));
      });
    }
    if (true) {
      relations = <Relations>[];
      json['relations'].forEach((v) {
        relations!.add( Relations.fromJson(v));
      });
    }
    if (true) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add( Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['isAdult'] = this.isAdult;
    data['countryOfOrigin'] = this.countryOfOrigin;
    data['image'] = this.image;
    data['cover'] = this.cover;
    data['description'] = this.description;
    data['status'] = this.status;
    data['releaseDate'] = this.releaseDate;
    if (this.startDate != null) {
      data['startDate'] = this.startDate!.toJson();
    }
    if (this.endDate != null) {
      data['endDate'] = this.endDate!.toJson();
    }
    if (this.nextAiringEpisode != null) {
      data['nextAiringEpisode'] = this.nextAiringEpisode!.toJson();
    }
    data['totalEpisodes'] = this.totalEpisodes;
    data['rating'] = this.rating;
    data['duration'] = this.duration;
    data['genres'] = this.genres;
    data['type'] = this.type;
    if (this.recommendations != null) {
      data['recommendations'] =
          this.recommendations!.map((v) => v.toJson()).toList();
    }
    if (this.relations != null) {
      data['relations'] = this.relations!.map((v) => v.toJson()).toList();
    }
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;

  Title({this.romaji, this.english, this.native});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    data['native'] = this.native;
    return data;
  }
}

class StartDate {
  int? year;
  int? month;
  int? day;

  StartDate({this.year, this.month, this.day});

  StartDate.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    return data;
  }
}

class Recommendations {
  int? id;
  int? malId;
  Title? title;
  String? status;
  int? episodes;
  String? image;
  String? cover;
  int? rating;
  String? type;

  Recommendations(
      {this.id,
        this.malId,
        this.title,
        this.status,
        this.episodes,
        this.image,
        this.cover,
        this.rating,
        this.type});

  Recommendations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    status = json['status'];
    episodes = json['episodes'];
    image = json['image'];
    cover = json['cover'];
    rating = json['rating'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['malId'] = this.malId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['status'] = this.status;
    data['episodes'] = this.episodes;
    data['image'] = this.image;
    data['cover'] = this.cover;
    data['rating'] = this.rating;
    data['type'] = this.type;
    return data;
  }
}

class Relations {
  int? id;
  String? relationType;
  int? malId;
  Title? title;
  String? status;
  int? episodes;
  String? image;
  String? color;
  String? type;
  int? rating;

  Relations(
      {this.id,
        this.relationType,
        this.malId,
        this.title,
        this.status,
        this.episodes,
        this.image,
        this.color,
        this.type,
        this.rating});

  Relations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    relationType = json['relationType'];
    malId = json['malId'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    status = json['status'];
    episodes = json['episodes'];
    image = json['image'];
    color = json['color'];
    type = json['type'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['relationType'] = this.relationType;
    data['malId'] = this.malId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['status'] = this.status;
    data['episodes'] = this.episodes;
    data['image'] = this.image;
    data['color'] = this.color;
    data['type'] = this.type;
    data['rating'] = this.rating;
    return data;
  }
}

class Episodes {
  String? id;
  String? title;
  String? description;
  int? number;
  String? image;

  Episodes({this.id, this.title, this.description, this.number, this.image});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    number = json['number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['number'] = this.number;
    data['image'] = this.image;
    return data;
  }
}



