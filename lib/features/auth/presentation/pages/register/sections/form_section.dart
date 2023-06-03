part of '../page.dart';

class _FromSection extends StatefulWidget {
  const _FromSection();

  @override
  State<_FromSection> createState() => _FromSectionState();
}

class _FromSectionState extends State<_FromSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    context.read<AuthBloc>().add(InitializeAuthEvent());
    nameController.addListener(_changeName);
    usernameController.addListener(_changeUsername);
    phoneController.addListener(_changePhone);
    emailController.addListener(_changeEmail);
    passwordController.addListener(_changePassword);
    super.initState();
  }

  void _changeName() {
    context.read<AuthBloc>().add(ChangeNameEvent(nameController.text));
  }

  void _changeUsername() {
    context.read<AuthBloc>().add(ChangeUsernameEvent(usernameController.text));
  }

  void _changePhone() {
    context.read<AuthBloc>().add(ChangePhoneEvent(phoneController.text));
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
              controller: nameController,
              label: 'Full Name',
              hintText: 'Your full name',
              prefixIcon: Icons.account_circle_rounded,
              errorText: state.name.isNotValid
                  ? 'Name length is at least 3 characters'
                  : null,
            ),
            Dimens.dp16.height,
            RegularInput(
              controller: usernameController,
              label: 'Username',
              hintText: 'Your username',
              prefixIcon: Icons.data_usage_rounded,
              inputFormatters: [UsernameInputFormatter()],
              errorText: state.username.isNotValid
                  ? 'Username length is at least 3 characters'
                  : null,
            ),
            Dimens.dp16.height,
            PhoneTextInput(
              controller: phoneController,
              label: 'Phone number',
              hintText: 'Your phone number',
              errorText: state.phoneNumber.isNotValid
                  ? 'IInvalid phone number!'
                  : null,
            ),
            Dimens.dp16.height,
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
              onPressed: state.isRegisterFormValid
                  ? () {
                      context.read<AuthBloc>().add(RegisterEvent());
                    }
                  : null,
              child: const Text('Create account'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
