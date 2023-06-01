import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class IconButtonComponent extends StatelessWidget {
  const IconButtonComponent({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
  });

  final Function()? onTap;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Dimens.dp2),
        decoration: BoxDecoration(
          color: color ?? context.theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: Dimens.dp18),
      ),
    );
  }
}
