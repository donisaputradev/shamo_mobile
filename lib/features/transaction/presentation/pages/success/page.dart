import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/home/home.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  static const String routeName = '/checkout/success';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout Success')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MainAssets.cart,
                width: Dimens.dp100,
              ),
              Dimens.dp20.height,
              const SubTitleText(
                'You made a transaction',
                align: TextAlign.center,
              ),
              const RegularText(
                'Stay at home while we\nprepare your dream shoes',
                align: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Dimens.dp30,
                  horizontal: Dimens.dp75,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainPage.routeName, (route) => false);
                      },
                      child: const Text('Order Other Shoes'),
                    ),
                    Dimens.dp12.height,
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainPage.routeName, (route) => false);
                      },
                      child: const Text('View My Order'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
