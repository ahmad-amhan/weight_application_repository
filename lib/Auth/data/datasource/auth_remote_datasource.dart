import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> signIn();
  Future<void> signOut();
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Faild with error '${e.code} : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
