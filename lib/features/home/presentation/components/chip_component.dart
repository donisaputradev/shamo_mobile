import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class ChipComponent extends StatelessWidget {
  const ChipComponent({
    super.key,
    required this.title,
    this.onTap,
    required this.isActive,
  });
  final String title;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimens.dp16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.dp12,
            vertical: Dimens.dp10,
          ),
          decoration: BoxDecoration(
            color: isActive ? context.theme.primaryColor : null,
            border: Border.all(
              color: isActive
                  ? context.theme.primaryColor
                  : context.theme.disabledColor.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(Dimens.dp10),
          ),
          child: RegularText(
            title,
            style: TextStyle(
              color: isActive
                  ? context.adaptiveTheme.solidTextColor
                  : context.theme.disabledColor,
            ),
          ),
        ),
      ),
    );
  }
}
