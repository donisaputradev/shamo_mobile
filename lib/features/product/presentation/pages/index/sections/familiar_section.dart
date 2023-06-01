part of '../page.dart';

class _FamiliarSection extends StatelessWidget {
  const _FamiliarSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: Dimens.dp14),
                child: SmartNetworkImage(
                  'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
                  width: Dimens.dp50,
                  height: Dimens.dp50,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(Dimens.dp6),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
