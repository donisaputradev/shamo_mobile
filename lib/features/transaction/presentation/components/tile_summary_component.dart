import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class TileSummaryComponent extends StatelessWidget {
  const TileSummaryComponent(
      {super.key, required this.content, required this.title});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RegularText(title, style: const TextStyle(fontSize: 12)),
        Dimens.dp8.width,
        Expanded(
          child: RegularText.mediumSolid(
            context,
            content,
            align: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
