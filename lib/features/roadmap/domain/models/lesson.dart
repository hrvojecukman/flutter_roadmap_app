import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String title;
  final String url;
  final int order;
  final DocumentReference documentReference;

  const Lesson({
    required this.title,
    required this.url,
    required this.order,
    required this.documentReference,
  });

  factory Lesson.fromJson({
    required Map<String, dynamic> json,
    required DocumentReference documentReference,
  }) {
    return Lesson(
      title: json["title"],
      url: json["url"],
      order: json["order"],
      documentReference: documentReference,
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "order": order,
      };

  @override
  List<Object?> get props => [url, title, documentReference, order];
}
