import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'sections/profile_section.dart';
part 'sections/general_section.dart';
part 'sections/account_section.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp32.height,
          const _ProfileSection(),
          Dimens.dp32.height,
          const SubTitleText('Account'),
          Dimens.dp8.height,
          const _AccountSection(),
          Dimens.dp32.height,
          const SubTitleText('General'),
          Dimens.dp8.height,
          const _GeneralSection(),
          (Dimens.height(context) / 10).height,
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.routeName, (route) => false);
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
