import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/repositories/comic_repository.dart';

class ComicRepositoryImpl implements ComicRepository {
  ComicRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Comic?> getComicBy({required int id}) {
    // TODO: implement getComicBy
    throw UnimplementedError();
  }

  @override
  Future<List<Comic>?> getComics() {
    return remoteDataSource.getComics();
  }
}
