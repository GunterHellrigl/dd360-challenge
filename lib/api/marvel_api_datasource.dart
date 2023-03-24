import 'dart:async';

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
  static const String base_url = "https://gateway.marvel.com:443/";

  final GetConnect connect = GetConnect();

  @override
  Future<List<Character>?> getCharacters(int offset, int limit) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetCharactersResponse data = GetCharactersResponse.fromJson(response.body);
      List<Character> characters = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(characters);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComics(int offset, int limit) async {
    Response response = await connect.get(
        "$base_url/v1/public/comics?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetComicsResponse data = GetComicsResponse.fromJson(response.body);
      List<Comic> comics = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(comics);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeries(int offset, int limit) async {
    Response response = await connect.get(
        "$base_url/v1/public/series?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856&offset=$offset&limit=$limit");

    if (response.isOk) {
      GetSeriesResponse data = GetSeriesResponse.fromJson(response.body);
      List<Serie> series = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(series);
    }

    return Future.value(null);
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters/$id?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharacterResponse data = GetCharacterResponse.fromJson(response.body);
      Character character = data.data.results[0].toDomain();

      return Future.value(character);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComicsBy({required int characterId}) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters/$characterId/comics?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharacterComicsResponse data = GetCharacterComicsResponse.fromJson(response.body);
      List<Comic> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Event>?> getEventsBy({required int characterId}) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters/$characterId/events?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharacterEventsResponse data = GetCharacterEventsResponse.fromJson(response.body);
      List<Event> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeriesBy({required int characterId}) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters/$characterId/series?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharacterSeriesResponse data = GetCharacterSeriesResponse.fromJson(response.body);
      List<Serie> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Story>?> getStoriesBy({required int characterId}) async {
    Response response = await connect.get(
        "$base_url/v1/public/characters/$characterId/stories?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharacterStoriesResponse data = GetCharacterStoriesResponse.fromJson(response.body);
      List<Story> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }
}
