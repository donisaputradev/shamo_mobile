part of '../page.dart';

class _PopularSection extends StatelessWidget {
  const _PopularSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductPage.routeName);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: Dimens.dp16),
                  decoration: BoxDecoration(
                    color: context.adaptiveTheme.solidTextColor,
                    borderRadius: BorderRadius.circular(Dimens.dp20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SmartNetworkImage(
                        'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
                        width: 190,
                        height: 150,
                        fit: BoxFit.cover,
                        radius: BorderRadius.vertical(
                          top: Radius.circular(Dimens.dp16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.dp16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RegularText(
                              'Hiking',
                              style: TextStyle(fontSize: 12),
                            ),
                            SubTitleText(
                              'Hiking',
                              style: TextStyle(
                                color: context.theme.scaffoldBackgroundColor,
                                fontSize: 18,
                              ),
                            ),
                            RegularText.semiBoldSolid(
                              context,
                              'text',
                              style: const TextStyle(
                                color: AppColors.blue,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
