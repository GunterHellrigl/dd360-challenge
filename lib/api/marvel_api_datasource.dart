import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/data/models/get_character_comics_response.dart';
import 'package:dd3challenge/data/models/get_character_events_response.dart';
import 'package:dd3challenge/data/models/get_character_response.dart';
import 'package:dd3challenge/data/models/get_character_series_response.dart';
import 'package:dd3challenge/data/models/get_character_stories_response.dart';
import 'package:dd3challenge/data/models/get_characters_response.dart';
import 'package:dd3challenge/data/models/get_comics_response.dart';
import 'package:dd3challenge/data/models/get_series_response.dart';
import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';
import 'package:get/get_connect.dart';

class MarvelApiDataSource implements RemoteDataSource {
  static const String baseUrl = "https://gateway.marvel.com:443/";
  static const String apiKey = "fea4ddbf370376865724c2b03db5ffef";
  static const String privateKey = "dcca949708ec8a3a3b97cf51cacf65cd98a314c4";

  final GetConnect connect = GetConnect();

  String _createHash(int ts) {
    return md5.convert(utf8.encode("${ts.toString()}$privateKey$apiKey")).toString();
  }

  @override
  Future<List<Character>?> getCharacters(int offset, int limit) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters?apikey=$apiKey&hash=$hash&ts=$ts&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetCharactersResponse data = GetCharactersResponse.fromJson(response.body);
      List<Character> characters = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(characters);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComics(int offset, int limit) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/comics?apikey=$apiKey&hash=$hash&ts=$ts&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetComicsResponse data = GetComicsResponse.fromJson(response.body);
      List<Comic> comics = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(comics);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeries(int offset, int limit) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/series?apikey=$apiKey&hash=$hash&ts=$ts&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetSeriesResponse data = GetSeriesResponse.fromJson(response.body);
      List<Serie> series = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(series);
    }

    return Future.value(null);
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response =
        await connect.get("$baseUrl/v1/public/characters/$id?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      GetCharacterResponse data = GetCharacterResponse.fromJson(response.body);
      Character character = data.data.results[0].toDomain();

      return Future.value(character);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComicsBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect
        .get("$baseUrl/v1/public/characters/$characterId/comics?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      GetCharacterComicsResponse data = GetCharacterComicsResponse.fromJson(response.body);
      List<Comic> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Event>?> getEventsBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect
        .get("$baseUrl/v1/public/characters/$characterId/events?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      GetCharacterEventsResponse data = GetCharacterEventsResponse.fromJson(response.body);
      List<Event> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeriesBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect
        .get("$baseUrl/v1/public/characters/$characterId/series?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      GetCharacterSeriesResponse data = GetCharacterSeriesResponse.fromJson(response.body);
      List<Serie> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Story>?> getStoriesBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _createHash(ts);

    Response response = await connect
        .get("$baseUrl/v1/public/characters/$characterId/stories?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      GetCharacterStoriesResponse data = GetCharacterStoriesResponse.fromJson(response.body);
      List<Story> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }
}
