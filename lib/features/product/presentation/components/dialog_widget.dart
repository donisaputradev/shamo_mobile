import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/cart/cart.dart';

class DialogSuccessWidget extends StatelessWidget {
  const DialogSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.dp32),
          margin: const EdgeInsets.all(Dimens.dp16),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      MainAssets.success,
                      width: Dimens.dp100,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ),
                ],
              ),
              Dimens.dp12.height,
              const SubTitleText(
                'Hurray :)',
                align: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const RegularText(
                'Item added successfully',
                align: TextAlign.center,
              ),
              Dimens.dp20.height,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.routeName);
                },
                child: const Text(
                  'View My Cart',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
