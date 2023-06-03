part of '../page.dart';

class _CategorySection extends StatelessWidget {
  const _CategorySection({required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            return Row(
              children: [
                ChipComponent(
                  title: 'All Shoes',
                  isActive: categoryId == '',
                  onTap: () {
                    context.read<ProductBloc>().add(
                          const GetListProductEvent(page: 2, categoryId: ''),
                        );
                  },
                ),
                ...state.categories
                    .map(
                      (e) => ChipComponent(
                        title: e.name,
                        isActive: categoryId == e.id,
                        onTap: () {
                          context.read<ProductBloc>().add(
                                GetListProductEvent(
                                  page: 1,
                                  categoryId: e.id,
                                ),
                              );
                        },
                      ),
                    )
                    .toList()
              ],
            );
          }
          return SkeletonAnimation(
            child: Row(
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => const Padding(
                      padding: EdgeInsets.only(right: Dimens.dp16),
                      child: Skeleton(
                        width: Dimens.dp100,
                        height: Dimens.dp32,
                        radius: Dimens.dp10,
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
