import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/repositories/serie_repository.dart';

class GetSeriesUseCase {
  GetSeriesUseCase({
    required this.serieRepository,
  });

  late final SerieRepository serieRepository;

  Future<List<Serie>?> execute(int offset, int limit) async {
    return await serieRepository.getSeries(offset, limit);
  }
}
