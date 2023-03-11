import 'package:cached_network_image/cached_network_image.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, UserModel?>(
      selector: (state) {
        return state.user;
      },
      builder: (context, user) {
        return GestureDetector(
          // onTap: () => context.goNamed(AppRoute.settings),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CaptionWidget(
                            S.of(context).greeting,
                            size: 12,
                          ),
                        ],
                      ),
                      TextWidget(
                        user?.fullName,
                        bold: true,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
                ClipOval(
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: user?.settings?.profileMediaUrl?.isNotEmpty == true
                        ? CachedNetworkImage(
                            imageUrl: user!.settings!.profileMediaUrl!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            AssetPath.iconUser,
                            color: Theme.of(context).cardColor,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
