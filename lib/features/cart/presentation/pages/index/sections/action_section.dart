part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              RegularText.normalSolid(context, 'Subtotal'),
              Dimens.dp16.width,
              const Expanded(
                child: SubTitleText(
                  'Rp287,96',
                  align: TextAlign.end,
                  style: TextStyle(color: AppColors.blue),
                ),
              ),
            ],
          ),
          Dimens.dp16.height,
          const Divider(thickness: .2),
          Dimens.dp16.height,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, CheckoutPage.routeName);
            },
            child: const Text('Continue to Checkout'),
          ),
        ],
      ),
    );
  }
}
