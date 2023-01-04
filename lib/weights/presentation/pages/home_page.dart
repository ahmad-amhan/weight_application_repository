import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/services/services_locator.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_bloc.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_event.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_state.dart';
import 'package:weight_tracker/weights/presentation/pages/weights_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            servicesLocator<WeightsBloc>()..add(const GetWeightsEvent()),
        child: Scaffold(
          body: BlocListener<WeightsBloc, WeightsState>(
              listener: (context, state) {
            if (state is WeightAdded) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Added success"),
                duration: Duration(seconds: 2),
              ));
            }
            if (state is WeightDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Deleted success"),
                duration: Duration(seconds: 2),
              ));
            }
            if (state is WeightUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Updated success"),
                duration: Duration(seconds: 2),
              ));
            }
          }, child: BlocBuilder<WeightsBloc, WeightsState>(
            builder: (context, state) {
              if (state is WeightAdding) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeightDeleting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeightUpdating) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeightError) {
                return Center(child: Text(state.error.toString()));
              }
              return const WeightsPage();
            },
          )),
        ));
  }
}
