import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/cart/cart.dart';
import 'package:shamo_mobile/features/transaction/transaction.dart';

part 'sections/action_section.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const String routeName = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: isEmpty
          ? const EmptyWidget(
              image: MainAssets.cart,
              title: 'Opss! Your Cart is Empty',
              desc: 'Let\'s find your favorite shoes',
            )
          : ListView.separated(
              padding: const EdgeInsets.all(Dimens.dp16),
              itemBuilder: (context, index) => const TileCartComponent(),
              separatorBuilder: (context, index) => Dimens.dp16.height,
              itemCount: 6,
            ),
      bottomNavigationBar: isEmpty ? null : const _ActionSection(),
    );
  }
}
