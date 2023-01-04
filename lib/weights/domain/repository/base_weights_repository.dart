import 'package:weight_tracker/weights/domain/entities/weight.dart';

abstract class BaseWeightsRepository {
  Future<List<Weight>> getWeights();
  Future deleteWeight({required String id});
  Future updateWeight(
      {required String note, required double weight, required String id});
  Future addWeight({required String note, required double weight});
}
