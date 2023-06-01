import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.onTap,
  });

  final String image;
  final String title;
  final String desc;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: Dimens.width(context) / 4,
          ),
          Dimens.dp24.height,
          SubTitleText(
            title,
            align: TextAlign.center,
          ),
          RegularText(
            desc,
            align: TextAlign.center,
          ),
          Dimens.dp20.height,
          ElevatedButton(
            onPressed: onTap,
            child: const Text('Explore Store'),
          ),
        ],
      ),
    );
  }
}
