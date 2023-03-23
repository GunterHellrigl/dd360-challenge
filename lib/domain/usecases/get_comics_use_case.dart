import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/repositories/comic_repository.dart';

class GetComicsUseCase {
  GetComicsUseCase({
    required this.comicRepository,
  });

  late final ComicRepository comicRepository;

  Future<List<Comic>?> execute() async {
    return await comicRepository.getComics();
  }
}
