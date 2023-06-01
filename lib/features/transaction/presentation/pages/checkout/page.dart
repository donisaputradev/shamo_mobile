import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/transaction/transaction.dart';

part 'sections/item_section.dart';
part 'sections/address_section.dart';
part 'sections/summary_section.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout Details')),
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          const SubTitleText('List Items'),
          Dimens.dp12.height,
          const _ItemSection(),
          Dimens.dp30.height,
          const _AddressSection(),
          Dimens.dp30.height,
          const _SummarySection(),
          Dimens.dp30.height,
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, CheckoutSuccessPage.routeName, (route) => false);
          },
          child: const Text('Checkout Now'),
        ),
      ),
    );
  }
}
