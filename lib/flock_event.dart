import 'package:bask_flock_proximity_app/member.dart';

abstract class FlockEvent {}

class StartTracking extends FlockEvent {}

class LocationUpdated extends FlockEvent {
  final double lat;
  final double lng;

  LocationUpdated(this.lat, this.lng);
}

class FilterByType extends FlockEvent {
  final MemberType? type; // null = show all

  FilterByType(this.type);
}