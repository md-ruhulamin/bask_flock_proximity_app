
import 'package:bask_flock_proximity_app/models/member.dart';

abstract class FlockState {}

class FlockLoading extends FlockState {}

class FlockLoaded extends FlockState {
  final List<Map<String, dynamic>> membersWithDistance;
  final MemberType? filterType;

  FlockLoaded(this.membersWithDistance, {this.filterType});
}

class FlockError extends FlockState {
  final String message;

  FlockError(this.message);
}
