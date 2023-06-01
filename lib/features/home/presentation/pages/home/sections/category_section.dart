part of '../page.dart';

class _CategorySection extends StatelessWidget {
  const _CategorySection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: Dimens.dp16),
                child: Chip(
                  label: const RegularText('Running'),
                  side: BorderSide(
                    width: .2,
                    color: context.theme.disabledColor.withOpacity(.5),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
