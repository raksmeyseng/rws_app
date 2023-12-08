import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/edit_profile/models/email_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/full_name_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/phone_number_input.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';

import '../bloc/edit_profile_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.formStatus != current.formStatus ||
          previous.uploadStatus != current.uploadStatus,
      listener: (context, state) {
        if (state.formStatus == FormzStatus.submissionSuccess) {
          showSnackBar(
            context,
            S.of(context).your_profile_has_been_updated,
            color: AppColor.success,
          );
          Navigator.of(context).pop();
        }
      },
      child: const SizedBox.expand(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Wrapper(
                maxWidth: appSmallMaxWidth,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    spacing: 40,
                    children: [
                      // _ProfilePicture(),
                      // SizedBox(height: 24.0),
                      _FormField(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class _ProfilePicture extends StatelessWidget {
//   const _ProfilePicture({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditProfileBloc, EditProfileState>(
//       buildWhen: (previous, current) =>
//           previous.uploadedProfile != current.uploadedProfile,
//       builder: (context, state) {
//         final authUser = Application.authBloc.state.user;
//         String? profileUrl = authUser?.profileUrl;
//         if (state.uploadedProfile != null) {
//           profileUrl = state.uploadedProfile?.url;
//         }
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   ClipOval(
//                     child: SizedBox(
//                       height: 120,
//                       width: 120,
//                       child: profileUrl?.isNotEmpty == true
//                           ? CachedNetworkImage(
//                               imageUrl: profileUrl!,
//                               fit: BoxFit.contain,
//                             )
//                           : Image.asset(
//                               AssetPath.iconUser,
//                               color: Theme.of(context)
//                                   .dividerColor
//                                   .withOpacity(.3),
//                               fit: BoxFit.contain,
//                             ),
//                     ),
//                   ),
//                   const _ProfileUploadIndecator(),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 8.0),
//                   const _ButtonUploadProfilePicture(),
//                   if (profileUrl?.isNotEmpty == true) ...[
//                     const SizedBox(height: 16.0),
//                     const _ButtonRemoveProfile(),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _ButtonRemoveProfile extends StatelessWidget {
//   const _ButtonRemoveProfile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => _removeProfile(context),
//       style: TextButton.styleFrom(
//         foregroundColor: AppColor.danger,
//       ),
//       child: TextWidget(
//         S.of(context).button_remove_profile,
//         color: AppColor.danger,
//       ),
//     );
//   }
// }

// Future<void> _removeProfile(BuildContext context) async {
//   final bloc = context.read<EditProfileBloc>();
//   final yes = await DialogHelper.showAnimatedDialog<bool>(
//     animationType: DialogAnimationType.fromBottom,
//     pageBuilder: (_, __, ___) => ConfirmDialog(
//       title: S.current.msg_title_remove_profile,
//       icon: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Image.asset(
//           AssetPath.iconUser,
//           color: AppColor.white,
//         ),
//       ),
//       message: S.current.msg_remove_profile,
//     ),
//   );
//   if (yes == true) {
//     bloc.add(const ProfilePictureRemoved());
//   }
// }

class _FormField extends StatelessWidget {
  const _FormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: _FullNameInput()),
            SizedBox(width: 24.0),
            Expanded(child: _EmailInput()),
          ],
        ),
        SizedBox(height: 24.0),
        Row(
          children: [
            Expanded(child: _PhoneNumberInput()),
          ],
        ),
      ],
    );
  }
}

// class _ProfileUploadIndecator extends StatelessWidget {
//   const _ProfileUploadIndecator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditProfileBloc, EditProfileState>(
//       buildWhen: (previous, current) =>
//           previous.uploadStatus != current.uploadStatus,
//       builder: (context, state) {
//         if (state.uploadStatus == BaseStatusEnum.inprogress) {
//           return CircularProgressIndicator(
//             color: Theme.of(context).primaryColor,
//           );
//         }
//         return const SizedBox(height: 0);
//       },
//     );
//   }
// }

// class _ButtonUploadProfilePicture extends StatelessWidget {
//   const _ButtonUploadProfilePicture({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditProfileBloc, EditProfileState>(
//       buildWhen: (previous, current) =>
//           previous.uploadStatus != current.uploadStatus,
//       builder: (context, state) {
//         return TextButton(
//           onPressed: state.uploadStatus == BaseStatusEnum.inprogress
//               ? null
//               : () => _actionButtonUpload(context),
//           child: TextWidget(
//             S.of(context).button_upload_profile,
//             color: Theme.of(context).primaryColor,
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _actionButtonUpload(BuildContext context) async {
//     final bloc = context.read<EditProfileBloc>();
//     final authUser = Application.authBloc.state.user;
//     String? profileUrl = authUser?.settings?.profileMediaUrl;
//     if (bloc.state.uploadedProfile?.url.isNotEmpty == true) {
//       profileUrl = bloc.state.uploadedProfile?.url;
//     }
//     final file = await ImagePickerHelper.pickImage(
//       context,
//       hasProfile: profileUrl?.isNotEmpty == true,
//     );
//     if (file == null) return;
//     if (file.path.isNotEmpty) {
//       bloc.add(ProfilePictureUploaded(file));
//     }
//   }
// }

class _FullNameInput extends StatelessWidget {
  const _FullNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).full_name.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<EditProfileBloc>().fullNameFocus,
              controller: context.read<EditProfileBloc>().fullNameController,
              onChanged: (pin) =>
                  context.read<EditProfileBloc>().add(FullNameChanged(pin)),
              isRequired: true,
              // prefixIcon: const Icon(Icons.person_outline),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                context.read<EditProfileBloc>().emailFocus.requestFocus();
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, EditProfileState state) {
    if (!state.fullNameInput.invalid) return null;
    switch (state.fullNameInput.error) {
      case FullNameInputValidationError.empty:
        return S.of(context).pls_input_your_full_name;
      default:
        return null;
    }
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.phoneNumberInput != current.phoneNumberInput,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                S.of(context).phone_number.toUpperCase(),
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              controller: context.read<EditProfileBloc>().phoneNumberController,
              keyboardType: TextInputType.phone,
              onChanged: (phone) {
                context.read<EditProfileBloc>().add(PhoneNumberChanged(phone));
              },
              // prefixIcon: const Icon(Icons.phone_outlined, size: 20),
              prefixText: '0',
              inputFormatters: [
                MaskTextInputFormatter(
                  initialText: state.phoneNumberInput.value,
                  mask: '*# ### ####',
                  filter: {'*': RegExp(r'[1-9]'), '#': RegExp(r'[0-9]')},
                ),
              ],
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, EditProfileState state) {
    if (!state.phoneNumberInput.invalid) return null;
    switch (state.phoneNumberInput.error) {
      // case PhoneNumberInputValidationError.empty:
      //   return S.of(context).pls_input_your_phone_number;
      case PhoneNumberInputValidationError.invalid:
        return S.of(context).invalid_phone_number;
      default:
        return null;
    }
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).email.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<EditProfileBloc>().emailFocus,
              controller: context.read<EditProfileBloc>().emailController,
              onChanged: (email) =>
                  context.read<EditProfileBloc>().add(EmailChanged(email)),
              keyboardType: TextInputType.emailAddress,
              // prefixIcon: const Icon(Icons.email_outlined),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.done,
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, EditProfileState state) {
    if (!state.emailInput.invalid) return null;
    switch (state.emailInput.error) {
      case EmailInputValidationError.empty:
        return S.of(context).pls_input_your_email;
      case EmailInputValidationError.invalid:
        return S.of(context).invalid_email;
      default:
        return null;
    }
  }
}
