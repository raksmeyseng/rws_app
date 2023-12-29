import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/app/widgets/auto_theme_item.dart';
import 'package:rws_app/core/modules/app/widgets/theme_item.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/setting/bloc/setting_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: SingleChildScrollView(
        child: Wrapper(
          maxWidth: appSmallMaxWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserProfile(),
              SizedBox(height: 10.0),
              Padding(
                padding:EdgeInsets.all(16.0),
                child: Column(
                  children:[
                    _AppTheme(),
                    // SizedBox(height: 14.0),
                    // _LanguageItem(),
                    // SizedBox(height: 14.0),
                    // _ChangePasswordItem(),
                    SizedBox(height: 14.0),
                    _LogOutButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, UserModel?>(
      selector: (state) {
        return state.user;
      },
      builder: (context, user) {
        String firstName =user?.firstName??'';
        String lastName= user?.lastName??''; 
        return FlatCard(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Hero(
                      tag: 'user_profile',
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: Theme.of(context).cardColor,
                            width: 1.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: ClipOval(
                            child:
                                // user?.profileUrl?.isNotEmpty == true
                                //     ? GestureDetector(
                                //         onTap: () {
                                //           Navigator.of(context).push(
                                //             MaterialPageRoute(
                                //               builder: (_) => ImageViewerPage(
                                //                 heroTag: 'user_profile',
                                //                 imageUrl: user.profileUrl!,
                                //               ),
                                //             ),
                                //           );
                                //         },
                                //         child: CachedNetworkImage(
                                //           imageUrl: user!.profileUrl!,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       )
                                //     :
                                Image.asset(
                              AssetPath.iconUser,
                              color: Theme.of(context).primaryColor,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          
                          child: TextWidget(
                            '$firstName $lastName',
                            bold: true,
                            size: 16,
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            color: AppColor.white,
                          ),
                        ),
                        CaptionWidget(user?.email, color: AppColor.white)
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    // _editProfile(context);
                  },
                  iconSize: 20,
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: AppColor.white,
                  ),
                  splashRadius: 25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // void _editProfile(BuildContext context) {
  //   context.pushNamed(AppRoute.editProfile);
  // }
}

class _AppTheme extends StatelessWidget {
  const _AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.theme != current.theme,
      builder: (context, state) {
        return FlatCard(
          borderRadius: 16.0,
          side: BorderSide(
            width: 1.5,
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(S.of(context).appearance),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ThemeItem(
                    title: S.of(context).light,
                    foregroundColor: AppColor.textLight,
                    backgroundColor: AppColor.card,
                    value: LightTheme.key,
                    groupValue: state.theme.getKey(),
                    onChanged: (v) => _onThemeChanged(context, v),
                  ),
                  ThemeItem(
                    title: S.of(context).dark,
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.cardDark,
                    value: DarkTheme.key,
                    groupValue: state.theme.getKey(),
                    onChanged: (v) => _onThemeChanged(context, v),
                  ),
                  AutoThemeItem(
                    title: S.of(context).system,
                    foregroundColor: AppColor.textLight,
                    backgroundColor: AppColor.cardDark,
                    value: AutoTheme.key,
                    groupValue: state.theme.getKey(),
                    onChanged: (v) => _onThemeChanged(context, v),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onThemeChanged(BuildContext context, String? key) {
    final options = context.read<AppBloc>().state.themeOptions;
    final theme = AppThemeFactory.buildTheme(key, themeOptions: options);
    context.read<AppBloc>().add(ThemeChanged(theme: theme));
  }
}

// class _ChangePasswordItem extends StatelessWidget {
//   const _ChangePasswordItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _SettingItem(
//       onTap: () {
//         context.pushNamed(AppRoute.changePassword);
//       },
//       iconSvg: AssetPath.iconPin,
//       label: S.of(context).change_password,
//     );
//   }
// }

class _LogOutButton extends StatelessWidget {
  const _LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      buildWhen: (previous, current) =>
          previous.logoutStatus != current.logoutStatus,
      builder: (context, state) {
        final processing = state.logoutStatus == BaseStatusEnum.inprogress;
        return _SettingItem(
          iconSvg: AssetPath.iconLogout,
          label: S.of(context).logout,
          color: Theme.of(context).primaryColor,
          onTap: processing ? null : () => _logout(context),
          processing: processing,
        );
      },
    );
  }

  Future<void> _logout(BuildContext context) async {
    final bloc = context.read<SettingBloc>();
    final yes = await DialogHelper.showAnimatedDialog<bool>(
      animationType: DialogAnimationType.fromBottom,
      pageBuilder: (_, __, ___) => ConfirmDialog(
        title: S.of(context).confirm,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetPath.iconLogout,
            color: Colors.white,
          ),
        ),
        message: S.of(context).confirm_logout_message,
      ),
    );

    if (yes == true) {
      bloc.add(const LogoutRequested());
    }
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    Key? key,
    required this.iconSvg,
    required this.label,
    this.onTap,
    this.color,
    this.processing = false,
  }) : super(key: key);

  final String iconSvg;
  final String label;
  final void Function()? onTap;
  final Color? color;
  final bool processing;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: processing ? null : onTap,
      borderRadius: 16.0,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  iconSvg,
                  color: color ?? Theme.of(context).iconTheme.color,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label,
                        color: color,
                        height: 1.8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          processing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}
