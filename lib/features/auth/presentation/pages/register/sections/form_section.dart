part of '../page.dart';

class _FromSection extends StatelessWidget {
  const _FromSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RegularInput(
          label: 'Full Name',
          hintText: 'Your full name',
          prefixIcon: Icons.account_circle_rounded,
        ),
        Dimens.dp16.height,
        const RegularInput(
          label: 'Username',
          hintText: 'Your username',
          prefixIcon: Icons.data_usage_rounded,
        ),
        Dimens.dp16.height,
        const RegularInput(
          label: 'Email Address',
          hintText: 'Your email address',
          prefixIcon: Icons.email_rounded,
          inputType: TextInputType.emailAddress,
        ),
        Dimens.dp16.height,
        const PasswordInput(
          label: 'Password',
          hintText: 'Your password',
        ),
        Dimens.dp32.height,
        ElevatedButton(
          onPressed: () {},
          child: const Text('Create account'),
        ),
      ],
    );
  }
}
