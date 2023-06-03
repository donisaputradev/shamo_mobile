part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(
                    'Halo, ${state.user?.name ?? ''}',
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RegularText('@${state.user?.username ?? ''}'),
                ],
              ),
            ),
            Dimens.dp16.width,
            Image.asset(MainAssets.user, width: Dimens.dp50),
          ],
        );
      },
    );
  }
}
