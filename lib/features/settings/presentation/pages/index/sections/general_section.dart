part of '../page.dart';

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TileComponent(title: 'Privacy & Policy'),
        TileComponent(title: 'Term of Service'),
        TileComponent(title: 'Rate App'),
      ],
    );
  }
}
