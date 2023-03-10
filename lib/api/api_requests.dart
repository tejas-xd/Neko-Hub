import 'package:dio/dio.dart';
import 'package:weeb_hub/api/model/infomodel.dart';
import 'package:weeb_hub/api/model/schedulemodel.dart';
import 'package:weeb_hub/api/model/model.dart';

class APIService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.consumet.org';

  Future<List<Results>> getTrendingAnime() async {
    try {
      final url = '$baseUrl/meta/anilist/trending';
      final response = await _dio.get(url);
      var anime = response.data['results'] as List;
      List<Results> animeList = anime.map((m) => Results.fromJson(m)).toList();
      return animeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Results>> getPopularAnime() async {
    try {
      final url = '$baseUrl/meta/anilist/popular';
      final response = await _dio.get(url);
      var anime = response.data['results'] as List;
      List<Results> animeList = anime.map((m) => Results.fromJson(m)).toList();
      return animeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Results>> getRecentAnime() async {
    try {
      final url = '$baseUrl/meta/anilist/recent-episodes';
      final response = await _dio.get(url);
      var anime = response.data['results'] as List;
      List<Results> animeList = anime.map((m) => Results.fromJson(m)).toList();
      return animeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<AnimeInfo> getinfo(String info) async {
    try {
      final url = '$baseUrl/meta/anilist/info/$info';
      final response = await _dio.get(url);
      var anime = response.data;
      AnimeInfo animeinfo = AnimeInfo.fromJson(anime);
      return animeinfo;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<SResults>> getschedule(String year,String week) async {
    try {
      final response = await _dio.get('https://animeschedule.net/api/v3/timetables/sub?year=$year&week=$week',
          options: Options(headers: {
        'Authorization': 'Bearer d9YFgDlELHp7Mnzc7wsplMcUDTYruE',
      }));
      var anime = response.data as List;
      List<SResults> animeList = anime.map((m) => SResults.fromJson(m)).toList();
      return animeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Results>> getSearchAnime(String query) async {
    try {
      final url = '$baseUrl/meta/anilist/$query';
      final response = await _dio.get(url);
      var anime = response.data['results'] as List;
      List<Results> animeList = anime.map((m) => Results.fromJson(m)).toList();
      return animeList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }


}