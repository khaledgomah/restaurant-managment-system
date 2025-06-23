import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/di.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:restaurant_system/features/checkout/presentation/views/check_out_view.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/presentation/screens/new_order_screen.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/pages/online_orders_view.dart';

class AppRoutes {
  static const String newOrder = '/new_order';
  static const String dashboard = '/';
  static const String checkout = '/checkout';
  static const String onlineOrder = '/online_order';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.checkout:
      final args = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CheckoutCubit(),
          child: CheckOutView(
            amountCents: args,
          ),
        ),
      );
    case '/':
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => DashboardCubit(),
                child: const DashboardScreen(),
              ));
    case AppRoutes.newOrder:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => NewOrderCubit(),
                child: const NewOrderScreen(),
              ));
    case AppRoutes.onlineOrder:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) =>
              OnlineOrderCubit(onlineOrderUseCases: instance()),
          child: OnlineOrdersView(),
        ),
      );
    default:
      return _defaultRoute(settings);
  }
}

Route<dynamic> _defaultRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text('Default Route'),
      ),
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}
