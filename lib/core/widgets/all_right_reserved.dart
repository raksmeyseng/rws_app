import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllRightReserved extends StatelessWidget {
  const AllRightReserved({Key? key, this.showLogo = true}) : super(key: key);

  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.theme != current.theme,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 60,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showLogo) ...[
                  Image.asset(
                    AssetPath.imgLogoApp,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 16.0),
                ],
                const CaptionWidget('© ${AppConstant.copyRightYear} RWS'),
              ],
            ),
          ),
        );
      },
    );
  }
}
