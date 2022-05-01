import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? email;
  final String? name;
  final List<DocumentReference> watchedLessons;

  const AppUser({
    required this.email,
    required this.name,
    required this.watchedLessons,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json["email"],
      name: json["name"],
      watchedLessons: json["watchedLessons"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "watchedLessons": watchedLessons,
      };

  @override
  List<Object?> get props => [
        email,
        name,
        watchedLessons,
      ];
}
