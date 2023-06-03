import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class CardPopularComponent extends StatelessWidget {
  const CardPopularComponent({
    super.key,
    required this.image,
    required this.category,
    required this.price,
    required this.title,
  });

  final String image;
  final String title;
  final String price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.only(right: Dimens.dp16),
      decoration: BoxDecoration(
        color: context.adaptiveTheme.solidTextColor,
        borderRadius: BorderRadius.circular(Dimens.dp20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartNetworkImage(
            image,
            width: 190,
            height: 150,
            fit: BoxFit.cover,
            radius: const BorderRadius.vertical(
              top: Radius.circular(Dimens.dp16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  category,
                  style: const TextStyle(fontSize: 12),
                ),
                Dimens.dp6.height,
                SubTitleText(
                  title,
                  style: TextStyle(
                    color: context.theme.scaffoldBackgroundColor,
                    fontSize: 18,
                  ),
                  maxLine: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Dimens.dp6.height,
                RegularText.semiBoldSolid(
                  context,
                  price,
                  style: const TextStyle(
                    color: AppColors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
