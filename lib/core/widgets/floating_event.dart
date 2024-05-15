import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';
import 'package:rws_app/core/modules/view_details/bloc/view_details_bloc.dart';
import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';

import '../modules/water_supplier_edit/view/water_supply_edit_page.dart';

class FloatingEvent extends StatelessWidget {
  const FloatingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
        buildWhen: (previous, current) =>
            previous.waterSupply != current.waterSupply,
        builder: (context, state) {
          return state.waterSupply!.status.id == 3
              ? SpeedDial(
                  icon: Icons.apps_sharp, //icon on Floating action button
                  activeIcon:
                      Icons.close, //icon when menu is expanded on button
                  backgroundColor: Theme.of(context).primaryColor,
                  activeBackgroundColor: Theme.of(context).primaryColor,
                  activeForegroundColor: AppColor.white,
                  visible: true,
                  closeManually: false,
                  curve: Curves.bounceIn,
                  overlayColor: AppColor.black,
                  overlayOpacity: 0.5,
                  elevation: 8.0, //shadow elevation of button
                  shape: const CircleBorder(), //shape of button
                  children: [
                    SpeedDialChild(
                      //speed dial child
                      child: const Icon(Icons.save),
                      backgroundColor: AppColor.active,
                      foregroundColor: AppColor.white,
                      label: S.of(context).submit,
                      labelStyle: const TextStyle(fontSize: 18.0),
                      onTap: () {
                        _submitDraft(context);
                        // if (state.waterSupply!.status.id == 3) {
                        //   Blurry(
                        //     title: S.of(context).submit,
                        //     description:
                        //         S.of(context).do_you_want_to_submit_this_data,
                        //     confirmButtonText: S.of(context).confirm,
                        //     onConfirmButtonPressed: () => _onSubmitDrated(context),
                        //     themeColor: AppColor.inactive,
                        //     icon: Icons.delete_outline_rounded,
                        //   ).show(context);
                        // } else {
                        //   //Navigator.pop(context);
                        //   Navigator.of(context).pop();
                        // }
                      },
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.edit),
                      backgroundColor: Colors.blue,
                      foregroundColor: AppColor.white,
                      label: S.of(context).edit,
                      labelStyle: const TextStyle(fontSize: 18.0),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return WaterSupplyEditPage(
                                title: S.of(context).edit,
                                waterSupplyId: state.waterSupplyId,
                                id: 1,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.delete),
                      foregroundColor: AppColor.white,
                      backgroundColor: AppColor.inactive,
                      label: S.of(context).delete,
                      labelStyle: const TextStyle(fontSize: 18.0),
                      onTap: () {
                        _delete(context);
                        // Blurry(
                        //   title: S.of(context).delete,
                        //   description: S.of(context).do_you_want_to_delete_this_draft,
                        //   confirmButtonText: S.of(context).confirm,
                        //   onConfirmButtonPressed: () => _onDeleteSubmited(context),
                        //   themeColor: AppColor.inactive,
                        //   icon: Icons.delete_outline_rounded,
                        // ).show(context);
                      },
                    ),
                  ],
                )
              : const SizedBox.shrink();
        });
  }

  void _onDeleteSubmited(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<ListDataDetailsBloc>().add(const DeleteSubmited());
  }

  void _onSubmitDrated(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<ListDataDetailsBloc>().add(const SubmitDrafted());
  }

  Future<void> _submitDraft(BuildContext context) async {
    final bloc = context.read<ListDataDetailsBloc>();
    final yes = await DialogHelper.showAnimatedDialog<bool>(
      animationType: DialogAnimationType.fromBottom,
      pageBuilder: (_, __, ___) => ConfirmDialog(
        title: S.of(context).confirm,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetPath.iconNotification,
            color: Colors.white,
          ),
        ),
        message: S.of(context).do_you_want_to_submit_this_data,
      ),
    );

    if (yes == true) {
      //bloc.add(const LogoutRequested());
      bloc.add(const SubmitDrafted());
    }
  }

  Future<void> _delete(BuildContext context) async {
    final bloc = context.read<ListDataDetailsBloc>();
    final yes = await DialogHelper.showAnimatedDialog<bool>(
      animationType: DialogAnimationType.fromBottom,
      pageBuilder: (_, __, ___) => ConfirmDialog(
        title: S.of(context).confirm,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetPath.iconTrashBin,
            color: Colors.white,
          ),
        ),
        message: S.of(context).do_you_want_to_delete_this_draft,
      ),
    );

    if (yes == true) {
      //bloc.add(const LogoutRequested());
      bloc.add(const DeleteSubmited());
    }
  }
}

// class _SubmitDraftButton extends StatelessWidget {
//   const _SubmitDraftButton();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
//       buildWhen: (previous, current) =>
//           previous.waterSupply!.status != current.waterSupply!.status,
//       builder: (context, state) {},
//     );
//   }
// }

