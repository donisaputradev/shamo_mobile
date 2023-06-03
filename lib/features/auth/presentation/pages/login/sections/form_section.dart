part of '../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection();

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    context.read<AuthBloc>().add(InitializeAuthEvent());
    emailController.addListener(_changeEmail);
    passwordController.addListener(_changePassword);
    super.initState();
  }

  void _changeEmail() {
    context.read<AuthBloc>().add(ChangeEmailEvent(emailController.text));
  }

  void _changePassword() {
    context.read<AuthBloc>().add(ChangePasswordEvent(passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.loading) {
          EasyLoading.show(status: 'Loading...');
        } else if (state.status == AuthStateStatus.authenticated) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (route) => false);
        } else if (state.status == AuthStateStatus.unauthenticated) {
          EasyLoading.dismiss();
        } else if (state.status == AuthStateStatus.failure ||
            state.status == AuthStateStatus.unauthenticated) {
          EasyLoading.dismiss();
          EasyLoading.showError(
            state.failure?.message ?? 'Something wrong!',
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularInput(
              controller: emailController,
              label: 'Email Address',
              hintText: 'Your email address',
              prefixIcon: Icons.email_rounded,
              inputType: TextInputType.emailAddress,
              errorText:
                  state.email.isNotValid ? 'Invalid email format!' : null,
            ),
            Dimens.dp16.height,
            PasswordInput(
              controller: passwordController,
              label: 'Password',
              hintText: 'Your password',
              errorText: state.password.isNotValid
                  ? 'Password length at least 6 characters!'
                  : null,
            ),
            Dimens.dp32.height,
            ElevatedButton(
              onPressed: state.isLoginFormValid
                  ? () {
                      context.read<AuthBloc>().add(LoginEvent());
                    }
                  : null,
              child: const Text('Log in'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
