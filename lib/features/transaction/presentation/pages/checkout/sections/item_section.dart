part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        children: [
          SmartNetworkImage(
            'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(Dimens.dp12),
          ),
          Dimens.dp12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semiBoldSolid(
                  context,
                  'Terrex Urban Low',
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Dimens.dp2.height,
                const RegularText(
                  'Rp143,98',
                  style: TextStyle(color: AppColors.blue),
                ),
              ],
            ),
          ),
          Dimens.dp12.width,
          const RegularText('2 items', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
