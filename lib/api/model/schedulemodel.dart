class SResults {
  String? title;
  String? route;
  String? romaji;
  String? english;
  String? native;
  String? delayedFrom;
  String? delayedUntil;
  String? status;
  String? episodeDate;
  int? episodeNumber;
  int? episodes;
  int? lengthMin;
  bool? donghua;
  String? airType;
  List<MediaTypes>? mediaTypes;
  String? imageVersionRoute;
  Streams? streams;
  String? airingStatus;
  int? subtractedEpisodeNumber;
  String? delayedText;

  SResults(
      {this.title,
        this.route,
        this.romaji,
        this.english,
        this.native,
        this.delayedFrom,
        this.delayedUntil,
        this.status,
        this.episodeDate,
        this.episodeNumber,
        this.episodes,
        this.lengthMin,
        this.donghua,
        this.airType,
        this.mediaTypes,
        this.imageVersionRoute,
        this.streams,
        this.airingStatus,
        this.subtractedEpisodeNumber,
        this.delayedText});

  SResults.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    route = json['route'];
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
    delayedFrom = json['delayedFrom'];
    delayedUntil = json['delayedUntil'];
    status = json['status'];
    episodeDate = json['episodeDate'];
    episodeNumber = json['episodeNumber'];
    episodes = json['episodes'];
    lengthMin = json['lengthMin'];
    donghua = json['donghua'];
    airType = json['airType'];
    if (json['mediaTypes'] != null) {
      mediaTypes = <MediaTypes>[];
      json['mediaTypes'].forEach((v) {
        mediaTypes!.add(new MediaTypes.fromJson(v));
      });
    }
    imageVersionRoute = json['imageVersionRoute'];
    streams =
    json['streams'] != null ? new Streams.fromJson(json['streams']) : null;
    airingStatus = json['airingStatus'];
    subtractedEpisodeNumber = json['subtractedEpisodeNumber'];
    delayedText = json['delayedText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['route'] = this.route;
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    data['native'] = this.native;
    data['delayedFrom'] = this.delayedFrom;
    data['delayedUntil'] = this.delayedUntil;
    data['status'] = this.status;
    data['episodeDate'] = this.episodeDate;
    data['episodeNumber'] = this.episodeNumber;
    data['episodes'] = this.episodes;
    data['lengthMin'] = this.lengthMin;
    data['donghua'] = this.donghua;
    data['airType'] = this.airType;
    if (this.mediaTypes != null) {
      data['mediaTypes'] = this.mediaTypes!.map((v) => v.toJson()).toList();
    }
    data['imageVersionRoute'] = this.imageVersionRoute;
    if (this.streams != null) {
      data['streams'] = this.streams!.toJson();
    }
    data['airingStatus'] = this.airingStatus;
    data['subtractedEpisodeNumber'] = this.subtractedEpisodeNumber;
    data['delayedText'] = this.delayedText;
    return data;
  }
}

class MediaTypes {
  String? name;
  String? route;

  MediaTypes({this.name, this.route});

  MediaTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['route'] = this.route;
    return data;
  }
}

class Streams {
  String? youtube;
  String? crunchyroll;
  String? vrv;
  String? netflix;
  String? hidive;
  String? hulu;
  String? funimation;
  String? amazon;

  Streams(
      {this.youtube,
        this.crunchyroll,
        this.vrv,
        this.netflix,
        this.hidive,
        this.hulu,
        this.funimation,
        this.amazon});

  Streams.fromJson(Map<String, dynamic> json) {
    youtube = json['youtube'];
    crunchyroll = json['crunchyroll'];
    vrv = json['vrv'];
    netflix = json['netflix'];
    hidive = json['hidive'];
    hulu = json['hulu'];
    funimation = json['funimation'];
    amazon = json['amazon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['youtube'] = this.youtube;
    data['crunchyroll'] = this.crunchyroll;
    data['vrv'] = this.vrv;
    data['netflix'] = this.netflix;
    data['hidive'] = this.hidive;
    data['hulu'] = this.hulu;
    data['funimation'] = this.funimation;
    data['amazon'] = this.amazon;
    return data;
  }
}