import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

part 'sections/form_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp32.height,
          const HeadingText('Login'),
          const RegularText('Sign In to Countinue'),
          (Dimens.height(context) / 15).height,
          const _FormSection(),
          (Dimens.height(context) / 2.5).height,
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterPage.routeName);
            },
            child: const RegularText(
              'Don\'t have an account? Create account',
              align: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
