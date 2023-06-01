part of '../page.dart';

class _NewSection extends StatelessWidget {
  const _NewSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Row(
        children: [
          const SmartNetworkImage(
            'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Dimens.dp12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegularText(
                  'Football',
                  style: TextStyle(fontSize: 12),
                ),
                Dimens.dp6.height,
                const SubTitleText(
                  'Predator 20.3 Firm Ground',
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Dimens.dp6.height,
                RegularText.semiBoldSolid(
                  context,
                  'dsfdsfs',
                  style: const TextStyle(color: AppColors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
      separatorBuilder: ((context, index) => Dimens.dp16.height),
      itemCount: 5,
    );
  }
}
