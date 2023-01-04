import 'package:equatable/equatable.dart';

abstract class WeightsEvent extends Equatable {
  const WeightsEvent();
  @override
  List<Object> get props => [];
}

class CreateEvent extends WeightsEvent {
  final String note;
  final double weight;
  const CreateEvent(this.note, this.weight);
}

class GetWeightsEvent extends WeightsEvent {
  const GetWeightsEvent();
}

class DeleteWeightEvent extends WeightsEvent {
  final String id;
  const DeleteWeightEvent(this.id);
}

class UpdateWeightEvent extends WeightsEvent {
  final String id;
  final String note;
  final double weight;
  const UpdateWeightEvent(this.id, this.note, this.weight);
}
