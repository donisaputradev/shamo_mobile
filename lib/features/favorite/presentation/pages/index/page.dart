import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Shoes')),
      body: const EmptyWidget(
        image: MainAssets.love,
        title: ' You don\'t have dream shoes?',
        desc: 'Let\'s find your favorite shoes',
      ),
    );
  }
}
