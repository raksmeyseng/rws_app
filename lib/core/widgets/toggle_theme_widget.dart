import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppBloc, AppState, AppTheme>(
      selector: (state) {
        return state.theme;
      },
      builder: (context, theme) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            onPressed: () => _setTheme(context, theme),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 450),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: theme.icon,
            ),
            iconSize: 20,
            splashRadius: 25,
          ),
        );
      },
    );
  }

  void _setTheme(BuildContext context, AppTheme theme) {
    final options = context.read<AppBloc>().state.themeOptions;
    final appTheme = AppThemeFactory.toggleTheme(
      theme.getKey(),
      themeOptions: options,
    );
    context.read<AppBloc>().add(ThemeChanged(theme: appTheme));
  }
}
