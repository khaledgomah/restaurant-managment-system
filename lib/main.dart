import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_system/features/online_order/constants.dart';
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
  //await Hive.openBox<Order>('pendingOrders');
  //addTestOrders(count: 10);
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


Future<void> addTestOrders({int count = 10}) async {
  final collection = FirebaseFirestore.instance.collection(OnlineOrderConstants.collectionName);
  int orderId = 0;
  for (int i = 0; i < count; i++) {
    final status = (i % 2 == 0) ? 'pending' : 'completed';

    final order = {
      'Burger': 1 + (i % 3),
      'Fries': 2,
      'Coke': i % 2,
    };

    final onlineOrder = {
      'status': status,
      'orderId': orderId,
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(Duration(minutes: i * 3))),
      'order': order,
    };
orderId++;
    await collection.add(onlineOrder);
  }

  print('✅ Added $count test orders.');
}
