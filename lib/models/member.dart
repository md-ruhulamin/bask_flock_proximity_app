/// Specialization enum for doctors
enum Specialization {
  cardiology,
  dentistry,
  dermatology,
  pediatrics,
  neurology,
  orthopedics,
  psychiatry,
  gastroenterology,
  generalPractitioner,
}

extension SpecializationExtension on Specialization {
  String get displayName {
    switch (this) {
      case Specialization.cardiology:
        return "Cardiology";
      case Specialization.dentistry:
        return "Dentistry";
      case Specialization.dermatology:
        return "Dermatology";
      case Specialization.pediatrics:
        return "Pediatrics";
      case Specialization.neurology:
        return "Neurology";
      case Specialization.orthopedics:
        return "Orthopedics";
      case Specialization.psychiatry:
        return "Psychiatry";
      case Specialization.gastroenterology:
        return "Gastroenterology";
      case Specialization.generalPractitioner:
        return "General Practice";
    }
  }

  String get icon {
    switch (this) {
      case Specialization.cardiology:
        return "❤️";
      case Specialization.dentistry:
        return "🦷";
      case Specialization.dermatology:
        return "💆";
      case Specialization.pediatrics:
        return "👶";
      case Specialization.neurology:
        return "🧠";
      case Specialization.orthopedics:
        return "🦴";
      case Specialization.psychiatry:
        return "🧘";
      case Specialization.gastroenterology:
        return "🫀";
      case Specialization.generalPractitioner:
        return "⚕️";
    }
  }
}

/// Member type: Doctor or Patient
enum MemberType { doctor, patient }

/// Disease/Condition model for patients
class MedicalCondition {
  final String name;
  final String severity; // mild, moderate, severe
  final DateTime diagnosedDate;
  final String description;

  MedicalCondition({
    required this.name,
    required this.severity,
    required this.diagnosedDate,
    required this.description,
  });
}

/// Enhanced Member model with detailed information
class Member {
  final String id;
  final String name;
  final String role;
  final double lat;
  final double lng;
  final MemberType type;
  final String profileImage; // URL or asset
  final String bio;
  final int experience; // years of experience (for doctors)
  final double rating; // out of 5
  final int reviews; // number of reviews
  final Specialization? specialization; // for doctors
  final List<MedicalCondition>? medicalConditions; // for patients
  final int? age; // for patients
  final String? bloodType; // for patients
  final bool isAvailable; // for doctors
  final String? lastVisit; // for patients - when they last visited
  final String? phoneNumber;
  final String? email;

  Member({
    required this.id,
    required this.name,
    required this.role,
    required this.lat,
    required this.lng,
    required this.type,
    this.profileImage = "assets/default_avatar.png",
    this.bio = "",
    this.experience = 0,
    this.rating = 0.0,
    this.reviews = 0,
    this.specialization,
    this.medicalConditions,
    this.age,
    this.bloodType,
    this.isAvailable = true,
    this.lastVisit,
    this.phoneNumber,
    this.email,
  });

  /// Get primary medical condition (first one)
  MedicalCondition? get primaryCondition {
    return medicalConditions?.isNotEmpty == true ? medicalConditions!.first : null;
  }

  /// Get all condition names as comma-separated string
  String get conditionNames {
    return medicalConditions?.map((c) => c.name).join(", ") ?? "No conditions";
  }

  /// Get the most severe condition
  MedicalCondition? get mostSevereCondition {
    if (medicalConditions?.isEmpty ?? true) return null;
    return medicalConditions!.reduce((a, b) {
      final severityOrder = {"mild": 1, "moderate": 2, "severe": 3};
      return (severityOrder[a.severity] ?? 0) > (severityOrder[b.severity] ?? 0)
          ? a
          : b;
    });
  }

  /// Format rating for display
  String get ratingDisplay => rating.toStringAsFixed(1);
}