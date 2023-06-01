import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(Dimens.dp12),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.dark[100],
        borderRadius: BorderRadius.circular(Dimens.dp12),
      ),
      child: child,
    );
  }
}
