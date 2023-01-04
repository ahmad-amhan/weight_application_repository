import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_bloc.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_event.dart';
import 'package:weight_tracker/weights/domain/entities/weight.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_bloc.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_event.dart';
import 'package:weight_tracker/weights/presentation/blocs/weights_bloc/weights_state.dart';
import 'package:weight_tracker/weights/presentation/widgets/weight_widget.dart';

class WeightsPage extends StatefulWidget {
  const WeightsPage({super.key});

  @override
  State<WeightsPage> createState() => _WeightsPageState();
}

class _WeightsPageState extends State<WeightsPage> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late String id;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeightsBloc>(context).add(const GetWeightsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(const SignOut());
                },
                child: const Text('Sign Out'))
          ],
          title: const Center(child: Text('Weights App')),
        ),
        body: BlocBuilder<WeightsBloc, WeightsState>(
          builder: (context, state) {
            if (state is WeightsLoaded) {
              List<Weight> data = state.weights;
              return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: WeightWidget(data: data[index]),
                      onTap: () => _create(data[index]),
                    );
                  });
            } else if (state is WeightsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Future<void> _create([Weight? weight]) async {
    _weightController.clear();
    _noteController.clear();
    if (weight != null) {
      id = weight.id;
      _weightController.text = weight.weight.toString();
      _noteController.text = weight.note;
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _noteController,
                  decoration: const InputDecoration(labelText: 'Note'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _weightController,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                (weight != null)
                    ? ElevatedButton(
                        child: const Text('Update'),
                        onPressed: () async {
                          _noteController.text;
                          if (double.tryParse(_weightController.text) != null &&
                              _noteController.text.isNotEmpty) {
                            _updateData(context);

                            _noteController.text = '';
                            _noteController.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                      )
                    : ElevatedButton(
                        child: const Text('Create'),
                        onPressed: () async {
                          _noteController.text;
                          if (double.tryParse(_weightController.text) != null &&
                              _noteController.text.isNotEmpty) {
                            _postData(context);

                            _noteController.text = '';
                            _noteController.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                      )
              ],
            ),
          );
        });
  }

  void _postData(context) {
    BlocProvider.of<WeightsBloc>(context).add(
      CreateEvent(_noteController.text, double.parse(_weightController.text)),
    );
  }

  void _updateData(context) {
    BlocProvider.of<WeightsBloc>(context).add(
      UpdateWeightEvent(
          id, _noteController.text, double.parse(_weightController.text)),
    );
  }
}
