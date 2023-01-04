import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/weights/domain/entities/weight.dart';

class WeightModel extends Weight {
  WeightModel(super.note, super.weight, super.id);
  factory WeightModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return WeightModel(json.data()['note'],
        double.parse(json.data()['weight'].toString()), json.id);
  }
}
