import 'package:dd3challenge/domain/models/story.dart';

abstract class StoryRepository {
  List<Story> getStories();
  Story getStoryBy({int id});
}
