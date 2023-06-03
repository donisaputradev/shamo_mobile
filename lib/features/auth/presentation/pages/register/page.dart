import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/home/home.dart';

part 'sections/form_section.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp32.height,
          const HeadingText('Create Account'),
          const RegularText('Register and Happy Shoping'),
          (Dimens.height(context) / 18).height,
          const _FromSection(),
          (Dimens.height(context) / 18).height,
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const RegularText(
              'Already have an account? Log in',
              align: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
