import 'package:get_it/get_it.dart';
import 'package:weight_tracker/weights/data/datasource/remote_data_source.dart';
import 'package:weight_tracker/weights/data/repository/weight_repository.dart';
import 'package:weight_tracker/weights/domain/repository/base_weights_repository.dart';
import 'package:weight_tracker/weights/domain/usecases/get_weights_usecase.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_bloc.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    //Data Source
    servicesLocator
        .registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    //Repository
    servicesLocator.registerLazySingleton<BaseWeightsRepository>(
        () => WeightsRepository(servicesLocator()));
    //Use Cases
    servicesLocator
        .registerLazySingleton(() => GetWeightsUseCase(servicesLocator()));
    //Bloc
    servicesLocator.registerFactory(() => WeightsBloc(servicesLocator()));
  }
}
