class AnimeInfo {
  String? id;
  Title? title;
  int? malId;
  List<String>? synonyms;
  bool? isLicensed;
  bool? isAdult;
  String? countryOfOrigin;
  String? image;
  int? popularity;
  String? color;
  String? cover;
  String? description;
  String? status;
  int? releaseDate;
  StartDate? startDate;
  EndDate? endDate;
  NextAiringEpisode? nextAiringEpisode;
  int? totalEpisodes;
  int? rating;
  int? duration;
  List<String>? genres;
  String? season;
  List<String>? studios;
  String? subOrDub;
  String? type;
  List<Recommendations>? recommendations;
  List<Characters>? characters;
  List<Relations>? relations;
  Mappings? mappings;
  List<Episodes>? episodes;

  AnimeInfo(
      {this.id,
        this.title,
        this.malId,
        this.synonyms,
        this.isLicensed,
        this.isAdult,
        this.countryOfOrigin,
        this.image,
        this.popularity,
        this.color,
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
        this.season,
        this.studios,
        this.subOrDub,
        this.type,
        this.recommendations,
        this.characters,
        this.relations,
        this.mappings,
        this.episodes});

  AnimeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    malId = json['malId'];
    synonyms = json['synonyms'].cast<String>();
    isLicensed = json['isLicensed'];
    isAdult = json['isAdult'];
    countryOfOrigin = json['countryOfOrigin'];
    image = json['image'];
    popularity = json['popularity'];
    color = json['color'];
    cover = json['cover'];
    description = json['description'];
    status = json['status'];
    releaseDate = json['releaseDate'];
    startDate = json['startDate'] != null
        ? new StartDate.fromJson(json['startDate'])
        : null;
    endDate =
    json['endDate'] != null ? new EndDate.fromJson(json['endDate']) : null;
    nextAiringEpisode = json['nextAiringEpisode'] != null
        ? new NextAiringEpisode.fromJson(json['nextAiringEpisode'])
        : null;
    totalEpisodes = json['totalEpisodes'];
    rating = json['rating'];
    duration = json['duration'];
    genres = json['genres'].cast<String>();
    season = json['season'];
    studios = json['studios'].cast<String>();
    subOrDub = json['subOrDub'];
    type = json['type'];
    if (json['recommendations'] != null) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(new Recommendations.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(new Characters.fromJson(v));
      });
    }
    if (json['relations'] != null) {
      relations = <Relations>[];
      json['relations'].forEach((v) {
        relations!.add(new Relations.fromJson(v));
      });
    }
    mappings = json['mappings'] != null
        ? new Mappings.fromJson(json['mappings'])
        : null;
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['malId'] = this.malId;
    data['synonyms'] = this.synonyms;
    data['isLicensed'] = this.isLicensed;
    data['isAdult'] = this.isAdult;
    data['countryOfOrigin'] = this.countryOfOrigin;
    data['image'] = this.image;
    data['popularity'] = this.popularity;
    data['color'] = this.color;
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
    data['season'] = this.season;
    data['studios'] = this.studios;
    data['subOrDub'] = this.subOrDub;
    data['type'] = this.type;
    if (this.recommendations != null) {
      data['recommendations'] =
          this.recommendations!.map((v) => v.toJson()).toList();
    }
    if (this.characters != null) {
      data['characters'] = this.characters!.map((v) => v.toJson()).toList();
    }
    if (this.relations != null) {
      data['relations'] = this.relations!.map((v) => v.toJson()).toList();
    }
    if (this.mappings != null) {
      data['mappings'] = this.mappings!.toJson();
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

class EndDate {
  Null? year;
  Null? month;
  Null? day;

  EndDate({this.year, this.month, this.day});

  EndDate.fromJson(Map<String, dynamic> json) {
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

class NextAiringEpisode {
  int? airingTime;
  int? timeUntilAiring;
  int? episode;

  NextAiringEpisode({this.airingTime, this.timeUntilAiring, this.episode});

  NextAiringEpisode.fromJson(Map<String, dynamic> json) {
    airingTime = json['airingTime'];
    timeUntilAiring = json['timeUntilAiring'];
    episode = json['episode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['airingTime'] = this.airingTime;
    data['timeUntilAiring'] = this.timeUntilAiring;
    data['episode'] = this.episode;
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


class Characters {
  int? id;
  String? role;
  Name? name;
  String? image;
  List<VoiceActors>? voiceActors;

  Characters({this.id, this.role, this.name, this.image, this.voiceActors});

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    image = json['image'];
    if (json['voiceActors'] != null) {
      voiceActors = <VoiceActors>[];
      json['voiceActors'].forEach((v) {
        voiceActors!.add(new VoiceActors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['image'] = this.image;
    if (this.voiceActors != null) {
      data['voiceActors'] = this.voiceActors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? first;
  String? last;
  String? full;
  String? native;
  String? userPreferred;

  Name({this.first, this.last, this.full, this.native, this.userPreferred});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    full = json['full'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['full'] = this.full;
    data['native'] = this.native;
    data['userPreferred'] = this.userPreferred;
    return data;
  }
}

class VoiceActors {
  int? id;
  String? language;
  Name? name;
  String? image;

  VoiceActors({this.id, this.language, this.name, this.image});

  VoiceActors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language'] = this.language;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['image'] = this.image;
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
  String? cover;
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
        this.cover,
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
    cover = json['cover'];
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
    data['cover'] = this.cover;
    data['rating'] = this.rating;
    return data;
  }
}

class Mappings {
  int? mal;
  int? anidb;
  int? kitsu;
  int? anilist;
  int? thetvdb;
  int? anisearch;
  int? livechart;
  String? notifyMoe;
  String? animePlanet;

  Mappings(
      {this.mal,
        this.anidb,
        this.kitsu,
        this.anilist,
        this.thetvdb,
        this.anisearch,
        this.livechart,
        this.notifyMoe,
        this.animePlanet});

  Mappings.fromJson(Map<String, dynamic> json) {
    mal = json['mal'];
    anidb = json['anidb'];
    kitsu = json['kitsu'];
    anilist = json['anilist'];
    thetvdb = json['thetvdb'];
    anisearch = json['anisearch'];
    livechart = json['livechart'];
    notifyMoe = json['notify.moe'];
    animePlanet = json['anime-planet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal'] = this.mal;
    data['anidb'] = this.anidb;
    data['kitsu'] = this.kitsu;
    data['anilist'] = this.anilist;
    data['thetvdb'] = this.thetvdb;
    data['anisearch'] = this.anisearch;
    data['livechart'] = this.livechart;
    data['notify.moe'] = this.notifyMoe;
    data['anime-planet'] = this.animePlanet;
    return data;
  }
}

class Episodes {
  String? id;
  String? title;
  String? description;
  int? number;
  String? image;
  String? airDate;

  Episodes(
      {this.id,
        this.title,
        this.description,
        this.number,
        this.image,
        this.airDate});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    number = json['number'];
    image = json['image'];
    airDate = json['airDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['number'] = this.number;
    data['image'] = this.image;
    data['airDate'] = this.airDate;
    return data;
  }
}
