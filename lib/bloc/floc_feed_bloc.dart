import 'dart:async';
import 'package:bask_flock_proximity_app/bloc/flock_feed_event.dart';
import 'package:bask_flock_proximity_app/bloc/flock_feed_state.dart';
import 'package:bask_flock_proximity_app/services/location_service.dart';
import 'package:bask_flock_proximity_app/models/member.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
class FlockBloc extends Bloc<FlockEvent, FlockState> {
  final LocationService locationService = LocationService();
  StreamSubscription? _locationSub;
  MemberType? _currentFilter;
  double? _lastLat;
  double? _lastLng;

  List<Member> members = [

    Member(
      id: "doc_001",
      name: "Dr. John Smith",
      role: "Cardiologist",
      lat: 21.8200,
      lng: 29.4200,
      type: MemberType.doctor,
      profileImage: "assets/doctor_1.png",
      bio: "Board-certified cardiologist with 12 years of experience",
      experience: 12,
      rating: 4.8,
      reviews: 243,
      specialization: Specialization.cardiology,
      isAvailable: true,
      phoneNumber: "+880-1700-123456",
      email: "john.smith@hospital.com",
    ),
    Member(
      id: "doc_002",
      name: "Dr. Sarah Johnson",
      role: "General Dentist",
      lat: 23.8000,
      lng: 90.4000,
      type: MemberType.doctor,
      profileImage: "assets/doctor_2.png",
      bio: "Specializing in cosmetic and restorative dentistry",
      experience: 8,
      rating: 4.6,
      reviews: 156,
      specialization: Specialization.dentistry,
      isAvailable: true,
      phoneNumber: "+880-1800-234567",
      email: "sarah.johnson@dentalcare.com",
    ),
    Member(
      id: "doc_003",
      name: "Dr. Michael Chen",
      role: "Dermatologist",
      lat: 23.7500,
      lng: 90.3800,
      type: MemberType.doctor,
      profileImage: "assets/doctor_3.png",
      bio: "Expert in skin conditions and aesthetic treatments",
      experience: 10,
      rating: 4.9,
      reviews: 198,
      specialization: Specialization.dermatology,
      isAvailable: false,
      phoneNumber: "+880-1900-345678",
      email: "michael.chen@skincare.com",
    ),
    Member(
      id: "doc_004",
      name: "Dr. Emily Rodriguez",
      role: "Orthopedic Surgeon",
      lat: 23.8100,
      lng: 90.4100,
      type: MemberType.doctor,
      profileImage: "assets/doctor_4.png",
      bio: "Specializing in joint replacement and sports medicine",
      experience: 15,
      rating: 4.7,
      reviews: 287,
      specialization: Specialization.orthopedics,
      isAvailable: true,
      phoneNumber: "+880-1750-456789",
      email: "emily.rodriguez@orthocenter.com",
    ),

    // PATIENTS
    Member(
      id: "pat_001",
      name: "Ahmed Hassan",
      role: "Patient",
      lat: 21.8250,
      lng: 29.4250,
      type: MemberType.patient,
      profileImage: "assets/patient_1.png",
      bio: "Recently diagnosed, seeking specialist consultation",
      age: 45,
      bloodType: "O+",
      lastVisit: "2024-02-05",
      medicalConditions: [
        MedicalCondition(
          name: "Hypertension",
          severity: "moderate",
          diagnosedDate: DateTime(2023, 6, 15),
          description: "High blood pressure, currently on medication",
        ),
        MedicalCondition(
          name: "Type 2 Diabetes",
          severity: "mild",
          diagnosedDate: DateTime(2022, 3, 20),
          description: "Managed with diet and exercise",
        ),
      ],
      phoneNumber: "+880-1600-567890",
      email: "ahmed.hassan@email.com",
    ),
    Member(
      id: "pat_002",
      name: "Fatima Khan",
      role: "Patient",
      lat: 23.8050,
      lng: 90.3950,
      type: MemberType.patient,
      profileImage: "assets/patient_2.png",
      bio: "Looking for preventive care and wellness consultation",
      age: 32,
      bloodType: "B+",
      lastVisit: "2024-01-28",
      medicalConditions: [
        MedicalCondition(
          name: "Seasonal Allergies",
          severity: "mild",
          diagnosedDate: DateTime(2021, 4, 10),
          description: "Allergic rhinitis, triggers in spring season",
        ),
      ],
      phoneNumber: "+880-1650-678901",
      email: "fatima.khan@email.com",
    ),
    Member(
      id: "pat_003",
      name: "Rajesh Kumar",
      role: "Patient",
      lat: 23.7800,
      lng: 90.3750,
      type: MemberType.patient,
      profileImage: "assets/patient_3.png",
      bio: "Post-surgery recovery, regular follow-up needed",
      age: 58,
      bloodType: "A+",
      lastVisit: "2024-02-08",
      medicalConditions: [
        MedicalCondition(
          name: "Post-ACL Surgery Recovery",
          severity: "moderate",
          diagnosedDate: DateTime(2024, 1, 15),
          description: "Undergoing physiotherapy, 4 weeks into recovery",
        ),
        MedicalCondition(
          name: "Chronic Back Pain",
          severity: "mild",
          diagnosedDate: DateTime(2020, 8, 5),
          description: "Lumbar strain, managed with exercises",
        ),
      ],
      phoneNumber: "+880-1700-789012",
      email: "rajesh.kumar@email.com",
    ),
    Member(
      id: "pat_004",
      name: "Ayesha Malik",
      role: "Patient",
      lat: 23.8150,
      lng: 90.4150,
      type: MemberType.patient,
      profileImage: "assets/patient_4.png",
      bio: "Seeking mental health support and counseling",
      age: 28,
      bloodType: "AB+",
      lastVisit: "2024-02-10",
      medicalConditions: [
        MedicalCondition(
          name: "Anxiety Disorder",
          severity: "moderate",
          diagnosedDate: DateTime(2023, 9, 12),
          description: "Generalized anxiety, on therapeutic treatment",
        ),
        MedicalCondition(
          name: "Mild Depression",
          severity: "mild",
          diagnosedDate: DateTime(2023, 10, 1),
          description: "Post-trauma related, improving with counseling",
        ),
      ],
      phoneNumber: "+880-1680-890123",
      email: "ayesha.malik@email.com",
    ),
  ];

  FlockBloc() : super(FlockLoading()) {
    on<StartTracking>(_startTracking);
    on<LocationUpdated>(_onLocationUpdated);
    on<FilterByType>(_onFilterByType);
  }

  /// Start location tracking
  Future<void> _startTracking(
      StartTracking event, Emitter<FlockState> emit) async {
    emit(FlockLoading());

    try {
      await locationService.checkPermission();

      _locationSub = locationService.getPositionStream().listen((pos) {
        add(LocationUpdated(pos.latitude, pos.longitude));
      });
    } catch (e) {
      emit(FlockError("Permission denied or location unavailable: ${e.toString()}"));
    }
  }

 
  void _onLocationUpdated(
      LocationUpdated event, Emitter<FlockState> emit) {
    // Store the latest location
    _lastLat = event.lat;
    _lastLng = event.lng;

    // Get filtered members
    List<Member> filteredMembers = members.where((m) {
      return _currentFilter == null || m.type == _currentFilter;
    }).toList();

 
    List<Map<String, dynamic>> result = filteredMembers
        .map((m) {
         
          double distanceInMeters = Geolocator.distanceBetween(
            event.lat,
            event.lng,
            m.lat,
            m.lng,
          );
          double distanceInKm = distanceInMeters / 1000;

          return {
            "member": m,
            "distance": distanceInKm.toStringAsFixed(2),
            "distanceValue": distanceInKm,
          };
        })
        .toList();

    // Sort by distance (nearest first)
    result.sort((a, b) => (a['distanceValue'] as double)
        .compareTo(b['distanceValue'] as double));

    emit(FlockLoaded(result, filterType: _currentFilter));
  }

  Future<void> _onFilterByType(
      FilterByType event, Emitter<FlockState> emit) async {

    _currentFilter = event.type;

      if (_lastLat != null && _lastLng != null) {
      
      List<Member> filteredMembers = members.where((m) {
        return event.type == null || m.type == event.type;
      }).toList();

    
      List<Map<String, dynamic>> result = filteredMembers
          .map((m) {
            double distanceInMeters = Geolocator.distanceBetween(
              _lastLat!,
              _lastLng!,
              m.lat,
              m.lng,
            );
            double distanceInKm = distanceInMeters / 1000;

            return {
              "member": m,
              "distance": distanceInKm.toStringAsFixed(2),
              "distanceValue": distanceInKm,
            };
          })
          .toList();

      // Sort by distance
      result.sort((a, b) => (a['distanceValue'] as double)
          .compareTo(b['distanceValue'] as double));

      emit(FlockLoaded(result, filterType: event.type));
    } else {
      // If no location data yet, just show loading
      emit(FlockLoading());
    }
  }

  @override
  Future<void> close() {
    _locationSub?.cancel();
    return super.close();
  }
}