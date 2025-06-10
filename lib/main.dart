import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:restaurant_system/features/dashboard/data/models/order_model.dart';
import 'package:restaurant_system/config/bloc_observer.dart';
import 'package:restaurant_system/config/di.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  init();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(OrderAdapter());
  await Hive.openBox<Order>('pendingOrders');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
