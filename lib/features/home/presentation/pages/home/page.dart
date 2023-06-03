import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/home/home.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'sections/profile_section.dart';
part 'sections/category_section.dart';
part 'sections/popular_section.dart';
part 'sections/product_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp32.height,
              const _ProfileSection(),
              Dimens.dp30.height,
              _CategorySection(categoryId: state.categoryId),
              Dimens.dp30.height,
              if (state.categoryId == '') ...[
                const HeadingText('Popular Products'),
                Dimens.dp16.height,
                const _PopularSection(),
                Dimens.dp30.height,
                const HeadingText('New Arrivals'),
                Dimens.dp16.height,
                _ProductSection(
                  products: state.products,
                  status: state.status,
                ),
              ] else ...[
                const HeadingText('For You'),
                Dimens.dp16.height,
                _ProductSection(
                  products: state.products,
                  status: state.status,
                ),
              ],
              Dimens.dp30.height,
            ],
          );
        },
      ),
    );
  }
}
