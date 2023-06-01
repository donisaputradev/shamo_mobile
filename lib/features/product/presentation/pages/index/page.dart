import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/cart/cart.dart';
import 'package:shamo_mobile/features/product/product.dart';

part 'sections/header_section.dart';
part 'sections/action_section.dart';
part 'sections/familiar_section.dart';
part 'sections/favorite_section.dart';
part 'sections/price_section.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      ),
      body: const _HeaderSection(),
      bottomSheet: Container(
        height: Dimens.height(context) / 1.7,
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(Dimens.dp20),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(Dimens.dp16),
          children: [
            const _FavoriteSection(),
            Dimens.dp20.height,
            const _PriceSection(),
            Dimens.dp30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.mediumSolid(context, 'Description'),
                Dimens.dp12.height,
                const RegularText(
                  'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                ),
              ],
            ),
            Dimens.dp30.height,
            RegularText.mediumSolid(context, 'Familiar Shoes'),
            Dimens.dp12.height,
            const _FamiliarSection(),
            Dimens.dp30.height,
            const _ActionSection(),
            Dimens.dp30.height,
          ],
        ),
      ),
    );
  }
}
