part of '../page.dart';

class _AddressSection extends StatelessWidget {
  const _AddressSection();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp12,
        vertical: Dimens.dp16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitleText('Address Details'),
          Dimens.dp12.height,
          const AddressComponent(
            title: 'Store Location',
            subtitle: 'Adidas Core',
            icon: Icons.copy_rounded,
          ),
          const SizedBox(
            height: Dimens.dp24,
            width: Dimens.dp40,
            child: VerticalDivider(),
          ),
          const AddressComponent(
            title: 'Your Address',
            subtitle: 'Mars',
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }
}
