import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class TileComponent extends StatelessWidget {
  const TileComponent({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimens.dp16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.dp8),
        child: Row(
          children: [
            Expanded(child: RegularText(title)),
            Dimens.dp16.width,
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: Dimens.dp18,
              color: context.theme.disabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
