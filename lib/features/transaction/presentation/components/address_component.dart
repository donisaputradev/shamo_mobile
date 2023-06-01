import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class AddressComponent extends StatelessWidget {
  const AddressComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.dp8),
          decoration: BoxDecoration(
            color: context.theme.disabledColor.withOpacity(.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.secondary,
          ),
        ),
        Dimens.dp12.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            RegularText.mediumSolid(context, subtitle),
          ],
        ),
      ],
    );
  }
}
