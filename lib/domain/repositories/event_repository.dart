import 'package:dd3challenge/domain/models/event.dart';

abstract class EventRepository {
  List<Event> getEvents();
  Event getEventBy({int id});
}
