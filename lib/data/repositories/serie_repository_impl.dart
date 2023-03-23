import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/repositories/serie_repository.dart';

class SerieRepositoryImpl implements SerieRepository {
  SerieRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Serie> getSerieBy({required int id}) {
    // TODO: implement getSerieBy
    throw UnimplementedError();
  }

  @override
  Future<List<Serie>?> getSeries() {
    return remoteDataSource.getSeries();
  }
}
