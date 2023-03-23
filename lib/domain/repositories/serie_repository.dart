import 'package:dd3challenge/domain/models/serie.dart';

abstract class SerieRepository {
  Future<List<Serie>?> getSeries();
  Future<Serie?> getSerieBy({required int id});
}
