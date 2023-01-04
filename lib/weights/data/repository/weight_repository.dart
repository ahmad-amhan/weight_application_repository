import 'package:weight_tracker/weights/data/datasource/remote_data_source.dart';
import 'package:weight_tracker/weights/domain/entities/weight.dart';
import 'package:weight_tracker/weights/domain/repository/base_weights_repository.dart';

class WeightsRepository implements BaseWeightsRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  WeightsRepository(this.baseRemoteDataSource);
  @override
  Future<List<Weight>> getWeights() async {
    return await baseRemoteDataSource.getWeights();
  }

  @override
  Future deleteWeight({required String id}) async {
    return await baseRemoteDataSource.deleteWeight(id: id);
  }

  @override
  Future<void> addWeight({required String note, required double weight}) async {
    return await baseRemoteDataSource.addWeight(weight: weight, note: note);
  }

  @override
  Future<void> updateWeight(
      {required String note,
      required double weight,
      required String id}) async {
    return await baseRemoteDataSource.updateWeight(
        note: note, weight: weight, id: id);
  }
}
