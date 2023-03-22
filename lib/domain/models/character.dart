import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailURI,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
  });

  late final int id;
  late final String name;
  late final String description;
  late final String thumbnailURI;
  late final List<Comic> comics;
  late final List<Serie> series;
  late final List<Story> stories;
  late final List<Event> events;
}
