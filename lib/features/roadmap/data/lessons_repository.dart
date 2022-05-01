import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_roadmap/common/errors/app_failure.dart';
import 'package:flutter_roadmap/common/errors/either_app_failure_or.dart';
import 'package:flutter_roadmap/common/firebase/firestore/firestore_collections.dart';
import 'package:flutter_roadmap/features/roadmap/domain/models/lesson.dart';
import 'package:injectable/injectable.dart';

abstract class LessonsRepository {
  EitherAppFailureOr<None> createLesson(Lesson lesson);

  EitherAppFailureOr<List<Lesson>> getLessons();
}

@Injectable(as: LessonsRepository)
class AppLessonsRepository implements LessonsRepository {
  final _lessonsCollection = FirebaseFirestore.instance
      .collection(
        FirestoreCollections.lessons,
      )
      .withConverter<Lesson>(
        fromFirestore: (snapshot, _) => Lesson.fromJson(
          json: snapshot.data() ?? {},
          documentReference: snapshot.reference,
        ),
        toFirestore: (faq, _) => faq.toJson(),
      );

  AppLessonsRepository();

  @override
  EitherAppFailureOr<List<Lesson>> getLessons() async {
    List<Lesson> lessons = [];
    try {
      await _lessonsCollection.get().then((value) {
        final documents = value.docs;
        for (final document in documents) {
          lessons.add(document.data());
        }
      });
    } catch (err) {
      return Left(AppFailure(
        "Error while getting lessons",
        message: err.toString(),
      ));
    }

    return Right(lessons);
  }

  @override
  EitherAppFailureOr<None> createLesson(
    Lesson lesson,
  ) async {
    try {
      await _lessonsCollection.add(lesson);
      return const Right(None());
    } catch (error) {
      return Left(AppFailure(
        "Error while creating lesson",
        message: error.toString(),
      ));
    }
  }
}
