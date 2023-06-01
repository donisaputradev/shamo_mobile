part of '../page.dart';

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp12,
        vertical: Dimens.dp16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitleText('Payment Summary'),
          Dimens.dp12.height,
          const TileSummaryComponent(
            content: '2 Items',
            title: 'Product Quantity',
          ),
          Dimens.dp12.height,
          const TileSummaryComponent(
            content: 'Rp256,55',
            title: 'Product Price',
          ),
          Dimens.dp12.height,
          const TileSummaryComponent(
            content: 'Free',
            title: 'Shipping',
          ),
          Dimens.dp12.height,
          const Divider(thickness: .3),
          Dimens.dp12.height,
          Row(
            children: [
              RegularText.semiBoldSolid(
                context,
                'Total',
                style: const TextStyle(color: AppColors.blue),
              ),
              Dimens.dp8.width,
              Expanded(
                child: RegularText.semiBoldSolid(
                  context,
                  'Rp300,23',
                  align: TextAlign.end,
                  style: const TextStyle(color: AppColors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
