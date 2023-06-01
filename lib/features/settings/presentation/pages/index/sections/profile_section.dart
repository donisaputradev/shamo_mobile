part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          MainAssets.user,
          width: 64,
        ),
        Dimens.dp16.width,
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText('Hallo, alex'),
              RegularText('asdasda'),
            ],
          ),
        ),
      ],
    );
  }
}
