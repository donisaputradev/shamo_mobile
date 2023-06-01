import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

part 'sections/profile_section.dart';
part 'sections/category_section.dart';
part 'sections/popular_section.dart';
part 'sections/new_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp32.height,
          const _ProfileSection(),
          Dimens.dp30.height,
          const _CategorySection(),
          Dimens.dp30.height,
          const HeadingText('Popular Products'),
          Dimens.dp16.height,
          const _PopularSection(),
          Dimens.dp30.height,
          const HeadingText('New Arrivals'),
          Dimens.dp16.height,
          const _NewSection(),
          Dimens.dp30.height,
        ],
      ),
    );
  }
}
