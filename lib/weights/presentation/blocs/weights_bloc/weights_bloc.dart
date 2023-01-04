import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/weights/domain/usecases/get_weights_usecase.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_event.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_state.dart';

class WeightsBloc extends Bloc<WeightsEvent, WeightsState> {
  final GetWeightsUseCase getWeightsUseCase;
  WeightsBloc(this.getWeightsUseCase) : super(InitialState()) {
    on<GetWeightsEvent>((event, emit) async {
      emit(WeightsLoading());
      try {
        final result = await getWeightsUseCase.get();
        emit(WeightsLoaded(result));
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<CreateEvent>((event, emit) async {
      emit(WeightAdding());
      try {
        await getWeightsUseCase.create(note: event.note, weight: event.weight);
        emit(WeightAdded());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<DeleteWeightEvent>((event, emit) async {
      emit(WeightDeleting());
      try {
        await getWeightsUseCase.delete(id: event.id);
        emit(WeightDeleted());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<UpdateWeightEvent>((event, emit) async {
      emit(WeightUpdating());
      try {
        await getWeightsUseCase.update(
            id: event.id, note: event.note, weight: event.weight);
        emit(WeightUpdated());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
  }
}
