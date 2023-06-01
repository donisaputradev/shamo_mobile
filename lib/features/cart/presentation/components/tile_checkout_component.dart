import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/cart/cart.dart';

class TileCartComponent extends StatelessWidget {
  const TileCartComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartNetworkImage(
                'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(Dimens.dp12),
              ),
              Dimens.dp12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semiBoldSolid(
                      context,
                      'Terrex Urban Low',
                      maxLine: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Dimens.dp2.height,
                    const RegularText(
                      'Rp143,98',
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ],
                ),
              ),
              Dimens.dp12.width,
              Column(
                children: [
                  IconButtonComponent(
                    icon: Icons.add,
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimens.dp2,
                    ),
                    child: RegularText.mediumSolid(context, '1'),
                  ),
                  IconButtonComponent(
                    icon: Icons.remove,
                    color: context.theme.disabledColor.withOpacity(.3),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Dimens.dp10.height,
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.trash_fill,
                  color: context.theme.colorScheme.error,
                  size: Dimens.dp16,
                ),
                Dimens.dp4.width,
                RegularText(
                  'Remove',
                  style: TextStyle(
                    color: context.theme.colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
