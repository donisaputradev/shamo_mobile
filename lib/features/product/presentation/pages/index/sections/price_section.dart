part of '../page.dart';

class _PriceSection extends StatelessWidget {
  const _PriceSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.dp16),
      decoration: BoxDecoration(
        color: context.theme.disabledColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(Dimens.dp4),
      ),
      child: Row(
        children: [
          const RegularText('Price starts from'),
          Dimens.dp8.width,
          const Expanded(
            child: SubTitleText(
              'Rp143,98',
              align: TextAlign.end,
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
