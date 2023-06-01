part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.chat_bubble_2_fill),
        ),
        Dimens.dp16.width,
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DialogSuccessWidget(),
              );
            },
            child: const Text('Add to Cart'),
          ),
        ),
      ],
    );
  }
}
