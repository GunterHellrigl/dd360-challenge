import 'package:dd3challenge/domain/models/serie.dart';

abstract class SerieRepository {
  List<Serie> getSeries();
  Serie getSerieBy({int id});
}
