import 'package:dio/dio.dart';
import 'model/model.dart';

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



}