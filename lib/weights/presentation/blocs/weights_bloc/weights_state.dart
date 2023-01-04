import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/weights/domain/entities/weight.dart';

@immutable
abstract class WeightsState extends Equatable {}

class InitialState extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightAdding extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightAdded extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightError extends WeightsState {
  final String error;

  WeightError(this.error);
  @override
  List<Object?> get props => [error];
}

class WeightsLoading extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightsLoaded extends WeightsState {
  final List<Weight> weights;
  WeightsLoaded(this.weights);
  @override
  List<Object?> get props => [weights];
}

class WeightDeleting extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightDeleted extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightUpdating extends WeightsState {
  @override
  List<Object?> get props => [];
}

class WeightUpdated extends WeightsState {
  @override
  List<Object?> get props => [];
}
