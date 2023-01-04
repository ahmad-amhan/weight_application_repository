import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/weights/domain/usecases/weights_usecase.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_event.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_state.dart';

class WeightsBloc extends Bloc<WeightsEvent, WeightsState> {
  final WeightsUseCase weightsUseCase;
  WeightsBloc(this.weightsUseCase) : super(InitialState()) {
    on<GetWeightsEvent>((event, emit) async {
      emit(WeightsLoading());
      try {
        final result = await weightsUseCase.get();
        emit(WeightsLoaded(result));
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<CreateEvent>((event, emit) async {
      emit(WeightAdding());
      try {
        await weightsUseCase.create(note: event.note, weight: event.weight);
        emit(WeightAdded());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<DeleteWeightEvent>((event, emit) async {
      emit(WeightDeleting());
      try {
        await weightsUseCase.delete(id: event.id);
        emit(WeightDeleted());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
    on<UpdateWeightEvent>((event, emit) async {
      emit(WeightUpdating());
      try {
        await weightsUseCase.update(
            id: event.id, note: event.note, weight: event.weight);
        emit(WeightUpdated());
      } catch (e) {
        emit(WeightError(e.toString()));
      }
    });
  }
}
