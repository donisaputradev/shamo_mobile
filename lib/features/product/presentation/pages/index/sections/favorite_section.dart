part of '../page.dart';

class _FavoriteSection extends StatelessWidget {
  const _FavoriteSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTitleText(
                'TERREX URBAN LOW',
                style: TextStyle(fontSize: 18),
              ),
              RegularText('Hiking'),
            ],
          ),
        ),
        Dimens.dp16.width,
        Container(
          padding: const EdgeInsets.all(Dimens.dp16),
          decoration: BoxDecoration(
            color: context.theme.primaryColor.withOpacity(.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite_rounded),
        ),
      ],
    );
  }
}
