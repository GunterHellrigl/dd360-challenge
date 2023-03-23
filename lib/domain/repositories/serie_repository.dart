import 'package:dd3challenge/domain/models/serie.dart';

abstract class SerieRepository {
  Future<List<Serie>?> getSeries(int offset, int limit);
  Future<Serie?> getSerieBy({required int id});
}
