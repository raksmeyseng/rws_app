import 'package:cached_network_image/cached_network_image.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/app/view/about_page.dart';
import 'package:rws_app/core/modules/app/widgets/auto_theme_item.dart';
import 'package:rws_app/core/modules/app/widgets/theme_item.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/image_viewer/image_viewer_page.dart';
import 'package:rws_app/core/modules/setting/bloc/setting_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrapper(
              maxWidth: appSmallMaxWidth,
              child: Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                  spacing: 40,
                  children: const [
                    SizedBox(height: 14.0),
                    _UserProfile(),
                    SizedBox(height: 14.0),
                    _AppTheme(),
                    // SizedBox(height: 14.0),
                    // _LanguageItem(),
                    SizedBox(height: 14.0),
                    _ChangePasswordItem(),
                    SizedBox(height: 14.0),
                    _AboutAppItem(),
                    SizedBox(height: 14.0),
                    _LogOutButton(),
                  ],
                ),
              ),
            ),
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
        return Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: double.infinity,
                child: FlatCard(
                  borderRadius: 16.0,
                  side: BorderSide(
                    width: 1.5,
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: IconButton(
                            onPressed: () => _editProfile(context),
                            iconSize: 20,
                            icon: const Icon(Icons.edit_outlined),
                            splashRadius: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (user?.gender != null)
                                  Image.asset(
                                    user!.gender!.getIconPath(),
                                    color: user.gender!.getColor(),
                                    width: 14,
                                    height: 14,
                                  ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: TextWidget(
                                      user?.fullName ?? '-',
                                      bold: true,
                                      size: 16,
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                // const SizedBox(width: 14),
                              ],
                            ),
                            CaptionWidget(user?.email)
                            // CaptionWidget(
                            //   TextHelper.securePhone(
                            //     phoneBeautify(user?.phoneNumber),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  width: 120,
                  height: 120,
                  child: ClipOval(
                    child: user?.profileUrl?.isNotEmpty == true
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ImageViewerPage(
                                    heroTag: 'user_profile',
                                    imageUrl: user.profileUrl!,
                                  ),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: user!.profileUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            AssetPath.iconUser,
                            color: Theme.of(context).primaryColor,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _editProfile(BuildContext context) {
    context.pushNamed(AppRoute.editProfile);
  }
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

class _ChangePasswordItem extends StatelessWidget {
  const _ChangePasswordItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SettingItem(
      onTap: () {
        context.pushNamed(AppRoute.changePassword);
      },
      iconSvg: AssetPath.iconPin,
      label: S.of(context).change_password,
    );
  }
}

class _AboutAppItem extends StatelessWidget {
  const _AboutAppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SettingItem(
      onTap: () {
        DialogHelper.showAnimatedDialog(
          pageBuilder: (_, a1, a2) {
            return BlocProvider.value(
              value: context.read<SettingBloc>(),
              child: const AboutPage(),
            );
          },
        );
      },
      iconSvg: AssetPath.iconInfo,
      label: S.of(context).about_app,
    );
  }
}

// class _DeactivateAccountItem extends StatelessWidget {
//   const _DeactivateAccountItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _SettingItem(
//       onTap: () => _deactivateAccount(context),
//       color: AppColor.danger,
//       iconSvg: AssetPath.iconTrashBin,
//       label: S.of(context).deactivate_account,
//     );
//   }

//   Future<void> _deactivateAccount(BuildContext context) async {
//     context.pushNamed(AppRoute.deactivation);
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
