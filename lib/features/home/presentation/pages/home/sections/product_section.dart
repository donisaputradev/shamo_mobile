part of '../page.dart';

class _ProductSection extends StatelessWidget {
  const _ProductSection({required this.products, required this.status});

  final List<Product> products;
  final ProductStateStatus status;

  @override
  Widget build(BuildContext context) {
    return status == ProductStateStatus.success
        ? ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductPage.routeName);
              },
              child: Row(
                children: [
                  SmartNetworkImage(
                    products[index].galleries.isNotEmpty
                        ? products[index].galleries[0].url.baseImage
                        : AppConfig.noImageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Dimens.dp12.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(
                          products[index].category.name,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Dimens.dp6.height,
                        SubTitleText(
                          products[index].name,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Dimens.dp6.height,
                        RegularText.semiBoldSolid(
                          context,
                          int.parse(products[index].price).toIDR(),
                          style: const TextStyle(color: AppColors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: ((context, index) => Dimens.dp16.height),
            itemCount: products.length,
          )
        : SkeletonAnimation(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Row(
                children: [
                  const Skeleton(width: 120, height: 120, radius: Dimens.dp20),
                  Dimens.dp12.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Skeleton(width: Dimens.dp100, height: 16),
                        Dimens.dp6.height,
                        const Skeleton(width: double.infinity, height: 20),
                        Dimens.dp6.height,
                        const Skeleton(width: Dimens.dp125, height: 16),
                      ],
                    ),
                  )
                ],
              ),
              separatorBuilder: ((context, index) => Dimens.dp16.height),
              itemCount: 5,
            ),
          );
  }
}
