part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText('Halo, Alex'),
              RegularText('@alexkhein'),
            ],
          ),
        ),
        Dimens.dp16.width,
        Image.asset(MainAssets.user, width: Dimens.dp50),
      ],
    );
  }
}
