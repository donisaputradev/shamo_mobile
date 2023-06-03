part of '../page.dart';

class _PopularSection extends StatelessWidget {
  const _PopularSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) {
          if (state is PopularSuccess) {
            return Row(
              children: state.products
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProductPage.routeName);
                      },
                      child: CardPopularComponent(
                        category: e.category.name,
                        image: e.galleries.isNotEmpty
                            ? e.galleries[0].url.baseImage
                            : AppConfig.noImageUrl,
                        price: int.parse(e.price).toIDR(),
                        title: e.name,
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return SkeletonAnimation(
            child: Row(
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => const Padding(
                      padding: EdgeInsets.only(right: Dimens.dp16),
                      child: Skeleton(
                        width: 190,
                        height: 240,
                        radius: Dimens.dp20,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
