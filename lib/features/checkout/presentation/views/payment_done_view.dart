import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/payment_status/payment_status_cubit.dart';

class PaymentDoneScreen extends StatefulWidget {
  const PaymentDoneScreen({super.key});

  @override
  State<PaymentDoneScreen> createState() => _PaymentDoneScreenState();
}

class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PaymentStatusCubit>(context).checkPaymentStatus();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      final state = BlocProvider.of<PaymentStatusCubit>(context).state;

      if (state is PaymentStatusSuccess) {
        timer.cancel();
      } else {
        BlocProvider.of<PaymentStatusCubit>(context).checkPaymentStatus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentStatusCubit, PaymentStatusState>(
        builder: (context, state) {
          if (state is PaymentStatusFailure) {
            return _buildStatusUI(
              icon: Icons.error,
              color: Colors.red,
              message: "Error occurred: ${state.message}",
            );
          }

          if (state is PaymentStatusSuccess) {
            return _buildStatusUI(
              icon: Icons.check_circle,
              color: Colors.green,
              message: "Payment completed successfully ✅",
            );
          }
          return _buildStatusUI(
            icon: Icons.hourglass_empty,
            color: Colors.orange,
            message: "Payment is still pending ⏳",
          );
        },
      ),
    );
  }

  Widget _buildStatusUI({
    required IconData icon,
    required Color color,
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 60),
          const SizedBox(height: 20),
          Text(message,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.newOrder,
                (route) => false,
              );
            },
            child: const Text('New Order'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
