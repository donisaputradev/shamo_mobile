part of '../page.dart';

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleText('General'),
        Dimens.dp16.height,
        _tile('Privacy & Policy'),
        _tile('Term of Service'),
        _tile('Rate App'),
      ],
    );
  }

  Widget _tile(String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.dp12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularText(title),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}