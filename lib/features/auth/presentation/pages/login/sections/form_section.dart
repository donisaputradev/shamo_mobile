part of '../page.dart';

class _FormSection extends StatelessWidget {
  const _FormSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, MainPage.routeName, (route) => false);
          },
          child: const Text('Log in'),
        ),
      ],
    );
  }
}
