import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:weight_tracker/weights/data/models/weight_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<WeightModel>> getWeights();
  Future deleteWeight({required String id});
  Future updateWeight(
      {required String note, required double weight, required String id});
  Future addWeight({required String note, required double weight});
}

class RemoteDataSource implements BaseRemoteDataSource {
  final db = FirebaseFirestore.instance.collection('Weights');

  @override
  Future<List<WeightModel>> getWeights() async {
    List<WeightModel> weightList = [];
    try {
      final weights = await db.orderBy('createdAt', descending: true).get();

      for (var element in weights.docs) {
        weightList.add(WeightModel.fromJson(element));
      }
      return weightList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
      return weightList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addWeight({required String note, required double weight}) async {
    try {
      await db
          .add({'note': note, 'weight': weight, 'createdAt': DateTime.now()});
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Faild with error '${e.code} : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteWeight({required String id}) async {
    return await db.doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  @override
  Future<void> updateWeight(
      {required String note,
      required double weight,
      required String id}) async {
    try {
      await db.doc(id).update({'note': note, 'weight': weight});
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Faild with error '${e.code} : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
