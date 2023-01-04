import 'package:weight_tracker/weights/domain/entities/weight.dart';
import 'package:weight_tracker/weights/domain/repository/base_weights_repository.dart';

class WeightsUseCase {
  final BaseWeightsRepository baseWeightsRepository;
  WeightsUseCase(this.baseWeightsRepository);
  Future<List<Weight>> get() async {
    return await (baseWeightsRepository.getWeights());
  }

  Future<void> create({required String note, required double weight}) async {
    return await (baseWeightsRepository.addWeight(note: note, weight: weight));
  }

  Future<void> delete({required String id}) async {
    return await (baseWeightsRepository.deleteWeight(id: id));
  }

  Future<void> update(
      {required String id,
      required String note,
      required double weight}) async {
    return await (baseWeightsRepository.updateWeight(
        note: note, id: id, weight: weight));
  }
}
