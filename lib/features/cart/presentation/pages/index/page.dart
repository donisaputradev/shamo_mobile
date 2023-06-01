import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: const EmptyWidget(
        image: MainAssets.cart,
        title: 'Opss! Your Cart is Empty',
        desc: 'Let\'s find your favorite shoes',
      ),
    );
  }
}
