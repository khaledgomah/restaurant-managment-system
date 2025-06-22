// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/checkout/constants.dart';
import 'package:restaurant_system/features/checkout/data/sources/sources.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/payment_status/payment_status_cubit.dart';
import 'package:restaurant_system/features/checkout/presentation/views/payment_done_view.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.amountCents});
  final int amountCents;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckoutCubit>(context).createCheckoutSession(
      OrderRequest(currency: 'EGP', amountCents: widget.amountCents),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutSuccess) {
            final paymentUrl =
                'https://accept.paymob.com/api/acceptance/iframes/${CheckoutConstants.iframeId}?payment_token=${state.paymentKeyResponse.paymentKey}';
            WidgetsBinding.instance.addPostFrameCallback((_) {
              html.window.open(paymentUrl, '_blank');
            });
            return BlocProvider(
              create: (context) => PaymentStatusCubit(),
              child: PaymentDoneScreen(),
            );
          } else if (state is CheckoutFailure) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CheckoutSuccessWidget extends StatelessWidget {
  const CheckoutSuccessWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
/* 
class IframeScreen extends StatefulWidget {
  final String paymentToken;

  const IframeScreen({super.key, required this.paymentToken});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.src =
        "https://accept.paymob.com/api/acceptance/iframes/${CheckoutConstants.iframeId}?payment_token=${widget.paymentToken}";
    _iFrameElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _iframeWidget,
          )
        ],
      ),
    );
  }
}
 */
