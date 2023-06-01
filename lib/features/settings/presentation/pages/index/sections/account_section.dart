part of '../page.dart';

class _AccountSection extends StatelessWidget {
  const _AccountSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TileComponent(title: 'Edit Profile'),
        TileComponent(title: 'Your Orders'),
        TileComponent(title: 'Help'),
      ],
    );
  }
}
