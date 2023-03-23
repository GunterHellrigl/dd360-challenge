import 'dart:async';

import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/data/models/get_characters_response.dart';
import 'package:dd3challenge/data/models/get_comics_response.dart';
import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:get/get_connect.dart';

class MarvelApiDataSource implements RemoteDataSource {
  static const String base_url = "https://gateway.marvel.com:443/";

  final GetConnect connect = GetConnect();

  @override
  Future<List<Character>?> getCharacters() async {
    Response response = await connect.get(
        "$base_url/v1/public/characters?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetCharactersResponse data = GetCharactersResponse.fromJson(response.body);
      List<Character> characters = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(characters);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComics() async {
    Response response = await connect.get(
        "$base_url/v1/public/comics?apikey=fea4ddbf370376865724c2b03db5ffef&hash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856");

    if (response.isOk) {
      GetComicsResponse data = GetComicsResponse.fromJson(response.body);
      List<Comic> comics = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(comics);
    }

    return Future.value(null);
  }
}
