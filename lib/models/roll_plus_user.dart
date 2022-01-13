import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'roll_plus_user.g.dart';

@JsonSerializable()
class User {
  final String email;
  final String firstName;
  final String lastName;
  final DocumentReference rideReference;
  final String braintreeCustomerId;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.rideReference,
    required this.braintreeCustomerId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
