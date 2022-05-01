import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_roadmap/common/errors/either_app_failure_or.dart';
import 'package:flutter_roadmap/common/firebase/firestore/firestore_collections.dart';
import 'package:flutter_roadmap/models/app_user.dart';

import '../../../common/errors/app_failure.dart';

abstract class UserRepository {
  EitherAppFailureOr<None> createNewUser();

  Stream<AppUser?> getUserStream();

  Future<AppUser?> getUser();

  Future<bool> isNewUser();

  DocumentReference getCurrentUserReference();
}

@Injectable(as: UserRepository)
class AppUserRepository implements UserRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _usersCollection = FirebaseFirestore.instance.collection(
    FirestoreCollections.users,
  );

  @override
  EitherAppFailureOr<None> createNewUser() async {
    try {
      final userReference = getCurrentUserReference();

      final _firebaseUser = _firebaseAuth.currentUser;

      final newappUser = AppUser(
        email: _firebaseUser?.email,
        name: _firebaseUser?.displayName,
      );

      //TODO: move later and different logic

      await userReference.set(newappUser.toJson());
      return const Right(None());
    } catch (exc) {
      return Left(AppFailure(
        "Error while creating user",
        message: exc.toString(),
      ));
    }
  }

  @override
  Stream<AppUser?> getUserStream() {
    final userReference = getCurrentUserReference();

    return userReference.snapshots().map(
      (userSnapshot) {
        final userJson = userSnapshot.data();

        if (userJson != null) {
          final appUser = AppUser.fromJson(userJson);
          return appUser;
        }
        return null;
      },
    );
  }

  @override
  Future<bool> isNewUser() async {
    final userReference = getCurrentUserReference();
    final userSnapshot = await userReference.get();
    if (userSnapshot.exists) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<AppUser?> getUser() async {
    final userReference = getCurrentUserReference();
    final userSnapshot = await userReference.get();

    final userJson = userSnapshot.data();

    if (userJson != null) {
      final appUser = AppUser.fromJson(userJson);
      return appUser;
    } else {
      return null;
    }
  }

  @override
  DocumentReference<Map<String, dynamic>> getCurrentUserReference() {
    final _firebaseUser = _firebaseAuth.currentUser;
    if (_firebaseUser == null) {
      throw Exception("Current user is null");
    }
    return _usersCollection.doc(_firebaseUser.uid);
  }
}
