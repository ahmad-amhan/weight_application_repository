import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/weights/domain/entities/weight.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_bloc.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_event.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Weight data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[400],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.note),
                    Text(data.weight.toString()),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<WeightsBloc>(context)
                              .add(DeleteWeightEvent(data.id));
                        },
                        child: const Text("Delete")),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
