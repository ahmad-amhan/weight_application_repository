import 'package:get_it/get_it.dart';
import 'package:weight_tracker/Auth/data/datasource/auth_remote_datasource.dart';
import 'package:weight_tracker/Auth/data/repository/auth_repository.dart';
import 'package:weight_tracker/Auth/domain/repository/base_auth_repository.dart';
import 'package:weight_tracker/Auth/domain/usecases/auth_usecase.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_bloc.dart';
import 'package:weight_tracker/weights/data/datasource/remote_data_source.dart';
import 'package:weight_tracker/weights/data/repository/weight_repository.dart';
import 'package:weight_tracker/weights/domain/repository/base_weights_repository.dart';
import 'package:weight_tracker/weights/domain/usecases/weights_usecase.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_bloc.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    //Data Source
    servicesLocator
        .registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    servicesLocator.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
    //Repository
    servicesLocator.registerLazySingleton<BaseWeightsRepository>(
        () => WeightsRepository(servicesLocator()));
    servicesLocator.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(servicesLocator()));
    //Use Cases
    servicesLocator
        .registerLazySingleton(() => WeightsUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(() => AuthUseCase(servicesLocator()));
    //Bloc
    servicesLocator.registerFactory(() => WeightsBloc(servicesLocator()));
    servicesLocator.registerFactory(() => AuthBloc(servicesLocator()));
  }
}
