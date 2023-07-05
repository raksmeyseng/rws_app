import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/change_password/models/confirm_password.dart';
import 'package:rws_app/core/modules/change_password/models/password.dart';
import 'package:rws_app/core/modules/user_information/bloc/reset_password/change_password_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import '../../authentication/models/user_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  String roleShow = '';
  String provinceIDDataEntry = '';
  String provincialIDDataEntry = '';
  String provinceDataEntry = '';

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, UserModel?>(
      selector: (state) {
        return state.user;
      },
      builder: (context, user) {
        // user role
        if (user?.isDataEntry == true){
          roleShow = 'Data Entry';
        }else if(user?.isHeadDepartment == true){
          roleShow = 'Department Head';
        }else if(user?.isProvincialDepartmentHead == true){
          roleShow = 'Provincial Department Head';
        }else if(user?.isDataVerifier1 == true){
          roleShow = 'Data Verifier 1';
        }else if(user?.isDataVerifier2 == true){
          roleShow = 'Data Verifier 2';
        }else if(user?.isPartner == true){
          roleShow = 'Partner';
        }

        // data entry
        provinceIDDataEntry = (user?.dataEntryProvinceId).toString();
        provincialIDDataEntry = (user?.provincialDepartmentHeadProvinceId).toString();
        conditionProvince();
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  // Center(
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         width: 130,
                  //         height: 130,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(width: 4, color: Colors.white),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   spreadRadius: 2,
                  //                   blurRadius: 10,
                  //                   color: Colors.black.withOpacity(0.1)
                  //               )
                  //             ],
                  //             shape: BoxShape.circle,
                  //             image: const DecorationImage(
                  //                 fit: BoxFit.cover,
                  //                 image: NetworkImage(
                  //                     'https://cdn-icons-png.flaticon.com/512/3135/3135823.png'
                  //                 )
                  //             )
                  //         ),
                  //       ),
                  //       Positioned(
                  //         bottom: 0,
                  //         right: 0,
                  //         child: Container(
                  //           height: 40,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               border: Border.all(
                  //                   width: 4,
                  //                   color: Colors.white
                  //               ),
                  //               color: Colors.blue
                  //           ),
                  //           child: const Icon(
                  //             Icons.edit,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //user information
                  Text(S.of(context).user_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  buildUser('Username : ', user?.username ?? '-'),
                  buildUser('First Name : ', user?.firstName ?? '-'),
                  buildUser('Last Name : ', user?.lastName ?? '-'),
                  buildUser('Role : ', roleShow),
                  buildUser('Province for Data Entry : ', provinceDataEntry),
                  //change password
                  const SizedBox(height: 30,),
                  Text(S.of(context).change_password, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  // buildCurrentPassword(S.of(context).current_password, 'Enter old password'),
                  const _CurrentPasswordInput(),
                  // buildNewPassword(S.of(context).new_password, 'Enter new password'),
                  const _NewPasswordInput(),
                  // buildRenewPassword(S.of(context).confirm_new_password, 'Enter confirm new password'),
                  const _ConfirmNewPasswordInput(),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ResetPasswordBloc>()
                  .add(const ResetPasswordSubmitted());
            },
            child: const Icon(Icons.save),
          ),
        );
      },
    );
  }


  Widget buildUser(String labelText, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
                color: Colors.grey
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(value),
          ),
        ],
      ),
    );
  }

  // Widget buildCurrentPassword(String labelChangePW, String hintText){
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 20),
  //     child: TextFormField(
  //       controller: oldPassword,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "password can't be empty";
  //         } else if (value.length > 8) {
  //           return 'password length must be >=8';
  //         }
  //         return null;
  //       },
  //       decoration: InputDecoration(
  //         contentPadding: const EdgeInsets.only(bottom: 5),
  //         labelText: labelChangePW,
  //         floatingLabelBehavior: FloatingLabelBehavior.always,
  //         hintText: hintText,
  //         hintStyle: const TextStyle(
  //           color: Colors.grey,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildNewPassword(String labelChangePW, String hintText){
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 20),
  //     child: TextFormField(
  //       controller: newPassword,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "new password can't be empty";
  //         } else if (value.length > 8) {
  //           return 'new password length must be >=8';
  //         }
  //         return null;
  //       },
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.only(bottom: 5),
  //           labelText: labelChangePW,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: hintText,
  //           hintStyle: const TextStyle(
  //             color: Colors.grey,
  //           ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildRenewPassword(String labelChangePW, String hintText){
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 20),
  //     child: TextFormField(
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "Confirm password can't be empty";
  //         } else if (value.length > 8) {
  //           return 'Confirm password length must be >=8';
  //         } else if (value != confirmNewPassword.text) {
  //           return 'Confirm Password and confirm password are not same';
  //         }
  //         return null;
  //       },
  //       controller: confirmNewPassword,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.only(bottom: 5),
  //           labelText: labelChangePW,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: hintText,
  //           hintStyle: const TextStyle(
  //             color: Colors.grey,
  //           ),
  //       ),
  //     ),
  //   );
  // }

  void conditionProvince(){
    if(provinceIDDataEntry == '1' || provincialIDDataEntry == '1'){
      provinceDataEntry = 'បន្ទាយមានជ័យ';
    }else if(provinceIDDataEntry == '2' || provincialIDDataEntry == '2'){
      provinceDataEntry = 'បាត់ដំបង';
    }else if(provinceIDDataEntry == '3' || provincialIDDataEntry == '3'){
      provinceDataEntry = 'កំពង់ចាម';
    }else if(provinceIDDataEntry == '4' || provincialIDDataEntry == '4'){
      provinceDataEntry = 'កំពង់ឆ្នាំង';
    }else if(provinceIDDataEntry == '5' || provincialIDDataEntry == '5'){
      provinceDataEntry = 'កំពង់ស្ពឺ';
    }else if(provinceIDDataEntry == '6' || provincialIDDataEntry == '6'){
      provinceDataEntry = 'កំពង់ធំ';
    }else if(provinceIDDataEntry == '7' || provincialIDDataEntry == '7'){
      provinceDataEntry = 'កំពត';
    }else if(provinceIDDataEntry == '8' || provincialIDDataEntry == '8'){
      provinceDataEntry = 'កណ្ដាល';
    }else if(provinceIDDataEntry == '9' || provincialIDDataEntry == '9'){
      provinceDataEntry = 'កោះកុង';
    }else if(provinceIDDataEntry == '10' || provincialIDDataEntry == '10'){
      provinceDataEntry = 'ក្រចេះ';
    }else if(provinceIDDataEntry == '11' || provincialIDDataEntry == '11'){
      provinceDataEntry = 'មណ្ឌលគិរី';
    }else if(provinceIDDataEntry == '12' || provincialIDDataEntry == '12'){
      provinceDataEntry = 'ភ្នំពេញ';
    }else if(provinceIDDataEntry == '13' || provincialIDDataEntry == '13'){
      provinceDataEntry = 'ព្រះវិហារ';
    }else if(provinceIDDataEntry == '14' || provincialIDDataEntry == '14'){
      provinceDataEntry = 'ព្រៃវែង';
    }else if(provinceIDDataEntry == '15' || provincialIDDataEntry == '15'){
      provinceDataEntry = 'ពោធិ៍សាត់';
    }else if(provinceIDDataEntry == '16' || provincialIDDataEntry == '16'){
      provinceDataEntry = 'រតនគិរី';
    }else if(provinceIDDataEntry == '17' || provincialIDDataEntry == '17'){
      provinceDataEntry = 'សៀមរាប';
    }else if(provinceIDDataEntry == '18' || provincialIDDataEntry == '18'){
      provinceDataEntry = 'ព្រះសីហនុ';
    }else if(provinceIDDataEntry == '19' || provincialIDDataEntry == '19'){
      provinceDataEntry = 'ស្ទឹងត្រែង';
    }else if(provinceIDDataEntry == '20' || provincialIDDataEntry == '20'){
      provinceDataEntry = 'ស្វាយរៀង';
    }else if(provinceIDDataEntry == '21' || provincialIDDataEntry == '21'){
      provinceDataEntry = 'តាកែវ';
    }else if(provinceIDDataEntry == '22' || provincialIDDataEntry == '22'){
      provinceDataEntry = 'ឧត្ដរមានជ័យ';
    }else if(provinceIDDataEntry == '23' || provincialIDDataEntry == '23'){
      provinceDataEntry = 'កែប';
    }else if(provinceIDDataEntry == '24' || provincialIDDataEntry == '24'){
      provinceDataEntry = 'ប៉ៃលិន';
    }else if(provinceIDDataEntry == '25' || provincialIDDataEntry == '25'){
      provinceDataEntry = 'ត្បូងឃ្មុំ';
    }

    print(provinceDataEntry);
  }
}

class _CurrentPasswordInput extends StatelessWidget {
  const _CurrentPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).current_password.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<ResetPasswordBloc>().currentPinFocus,
              onChanged: (pin) =>
                  context.read<ResetPasswordBloc>().add(CurrentPasswordChanged(pin)),
              keyboardType: TextInputType.number,
              obscureText: !state.currentPasswordVisibility,
              isRequired: true,
              suffixIcon: IconButton(
                icon: Icon(
                  state.currentPasswordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () => context
                    .read<ResetPasswordBloc>()
                    .add(const ToggleCurrentPassVisibility()),
              ),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                context
                    .read<ResetPasswordBloc>()
                    .currentPinFocus
                    .requestFocus();
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, ResetPasswordState state) {
    if (!state.currentPassword.invalid) return null;
    switch (state.currentPassword.error) {
      case PasswordValidationError.empty:
      case PasswordValidationError.invalid:
        return S.of(context).pls_input_your_password;
      default:
        return null;
    }
  }
}

class _NewPasswordInput extends StatelessWidget {
  const _NewPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).new_password.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<ResetPasswordBloc>().newPinFocus,
              onChanged: (pin) =>
                  context.read<ResetPasswordBloc>().add(NewPasswordChanged(pin)),
              keyboardType: TextInputType.number,
              obscureText: !state.newPasswordVisibility,
              isRequired: true,
              suffixIcon: IconButton(
                icon: Icon(
                  state.newPasswordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () => context
                    .read<ResetPasswordBloc>()
                    .add(const ToggleNewPassVisibility()),
              ),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                context
                    .read<ResetPasswordBloc>()
                    .newPinFocus
                    .requestFocus();
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, ResetPasswordState state) {
    if (!state.newPassword.invalid) return null;
    switch (state.newPassword.error) {
      case PasswordValidationError.empty:
      case PasswordValidationError.invalid:
        return S.of(context).input_new_password;
      default:
        return null;
    }
  }
}

class _ConfirmNewPasswordInput extends StatelessWidget {
  const _ConfirmNewPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).confirm_new_password.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<ResetPasswordBloc>().confirmNewPinFocus,
              onChanged: (pin) =>
                  context.read<ResetPasswordBloc>().add(ConfirmPasswordChanged(pin)),
              keyboardType: TextInputType.number,
              obscureText: !state.confirmPassVisibility,
              isRequired: true,
              suffixIcon: IconButton(
                icon: Icon(
                  state.confirmPassVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () => context
                    .read<ResetPasswordBloc>()
                    .add(const ToggleConfirmNewPassVisibility()),
              ),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                context
                    .read<ResetPasswordBloc>()
                    .confirmNewPinFocus
                    .requestFocus();
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, ResetPasswordState state) {
    if (!state.confirmPassword.invalid) return null;
    switch (state.confirmPassword.error) {
      case ConfirmPasswordValidationError.empty:
        return S.of(context).confirm_new_password;
      case ConfirmPasswordValidationError.mismatch:
        return S.of(context).password_mismatch;
      default:
        return null;
    }
  }
}

