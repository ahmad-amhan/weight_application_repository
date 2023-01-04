import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/services/services_locator.dart';
import 'package:weight_tracker/firebase_options.dart';
import 'package:weight_tracker/weights/data/repository/weight_repository.dart';
import 'package:weight_tracker/weights/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  ServicesLocator().init();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => WeightsRepository(servicesLocator()),
        child: const Home(),
      ),
    );
  }
}
