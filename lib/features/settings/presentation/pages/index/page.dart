import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Dimens.dp250,
            color: context.theme.primaryColor,
          ),
          ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp32.height,
              HeadingText(
                'My Profile',
                style: TextStyle(color: context.adaptiveTheme.backgroundColor),
              ),
              (Dimens.height(context) / 32).height,
              const RegularText('Theme', align: TextAlign.center),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, theme) {
                  return Switch(
                    value: theme.theme == AppTheme.light,
                    onChanged: (v) {
                      if (v) {
                        context.read<ThemeBloc>().add(
                              const ThemeChanged(AppTheme.light),
                            );
                      } else {
                        context.read<ThemeBloc>().add(
                              const ThemeChanged(AppTheme.dark),
                            );
                      }
                    },
                  );
                },
              ),
              (Dimens.height(context) / 32).height,
            ],
          ),
        ],
      ),
    );
  }
}
