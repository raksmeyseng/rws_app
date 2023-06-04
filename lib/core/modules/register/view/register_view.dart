import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/modules/register/bloc/register_bloc.dart';
import 'package:rws_app/core/modules/register/models/dob_input.dart';
import 'package:rws_app/core/modules/register/models/email_input.dart';
import 'package:rws_app/core/modules/register/models/full_name_input.dart';
import 'package:rws_app/core/modules/register/models/gender_input.dart';
import 'package:rws_app/core/modules/register/models/phone_number_input.dart';
import 'package:rws_app/core/widgets/header_icon.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _RegisterIcon(),
                  _Title(),
                  SizedBox(height: 24.0),
                  _FullNameInput(),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _DOBInput(),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        flex: 1,
                        child: _GenderInput(),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _PhoneNumberInput(),
                  SizedBox(height: 16.0),
                  _EmailInput(),
                  SizedBox(height: 16.0),
                  _CheckBoxPrivacyAgreement(),
                  SizedBox(height: 48.0),
                  _SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterIcon extends StatelessWidget {
  const _RegisterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HeaderIcon(
      iconPath: AssetPath.iconUser,
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextWidget(
        S.of(context).create_new_account,
        bold: true,
        size: 18,
      ),
    );
  }
}

class _FullNameInput extends StatelessWidget {
  const _FullNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return MyTextInput(
          focusNode: context.read<RegisterBloc>().fullNameFocus,
          onChanged: (pin) =>
              context.read<RegisterBloc>().add(FullNameChanged(pin)),
          label: S.of(context).full_name,
          isRequired: true,
          textInputAction: TextInputAction.next,
          prefixIcon: const Icon(Icons.person_outline),
          errorText: _handleErrorText(context, state),
          onSubmitted: (value) {
            context.read<RegisterBloc>().phoneNumberFocus.requestFocus();
          },
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, RegisterState state) {
    if (!state.fullNameInput.invalid) return null;
    switch (state.fullNameInput.error) {
      case FullNameInputValidationError.empty:
        return S.of(context).pls_input_your_full_name;
      default:
        return null;
    }
  }
}

class _DOBInput extends StatefulWidget {
  const _DOBInput({Key? key}) : super(key: key);

  @override
  State<_DOBInput> createState() => _DOBInputState();
}

class _DOBInputState extends State<_DOBInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.dobInput != current.dobInput,
      builder: (context, state) {
        return MyTextInput(
          controller: controller,
          onTap: () async {
            final date = await _pickDate(context);
            if (date != null && mounted) {
              context.read<RegisterBloc>().add(DOBChanged(date));
              controller.text = DateHelper.formatDate(date) ?? '';
            }
          },
          label: S.of(context).date_of_birth,
          readOnly: true,
          prefixIcon: const Icon(Icons.event_outlined),
          suffixIcon: const Icon(Icons.arrow_drop_down),
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, RegisterState state) {
    if (!state.dobInput.invalid) return null;
    switch (state.dobInput.error) {
      case DOBInputValidationError.empty:
        return S.of(context).pls_input_your_dob;
      default:
        return null;
    }
  }

  Future<DateTime?> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate:
          context.read<RegisterBloc>().state.dobInput.value ?? DateTime.now(),
      firstDate: DateHelper.calendarFirstDate(),
      lastDate: DateHelper.calendarLastDate(),
    );
    return date;
  }
}

class _GenderInput extends StatefulWidget {
  const _GenderInput({Key? key}) : super(key: key);

  @override
  State<_GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<_GenderInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return MyTextInput(
          controller: controller,
          onTap: () async {
            final pickedGender =
                await DialogHelper.showAnimatedDialog<GenderEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (_, __, ___) {
                return MySimpleDialog(
                  title: S.of(context).gender,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...GenderEnum.values.map(
                          (gender) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(gender);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            leading: Image.asset(
                              gender.getIconPath(),
                              color: gender.getColor(),
                              width: 20,
                              height: 20,
                            ),
                            trailing: gender == state.genderInput.value
                                ? Icon(
                                    Icons.check,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : null,
                            title: TextWidget(gender.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (pickedGender != null && mounted) {
              context.read<RegisterBloc>().add(GenderChanged(pickedGender));
              controller.text = pickedGender.getDisplayText(context);
            }
          },
          label: S.of(context).gender,
          readOnly: true,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, RegisterState state) {
    if (!state.genderInput.invalid) return null;
    switch (state.genderInput.error) {
      case GenderInputValidationError.empty:
        return S.of(context).pls_input_your_gender;
      default:
        return null;
    }
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.phoneNumberInput != current.phoneNumberInput,
      builder: (context, state) {
        return MyTextInput(
          isRequired: true,
          focusNode: context.read<RegisterBloc>().phoneNumberFocus,
          label: S.of(context).phone_number,
          keyboardType: TextInputType.phone,
          onChanged: (phone) {
            context.read<RegisterBloc>().add(PhoneNumberChanged(phone));
          },
          prefixIcon: const Icon(Icons.phone_outlined, size: 20),
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
          onSubmitted: (value) {
            context.read<RegisterBloc>().emailFocus.requestFocus();
          },
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, RegisterState state) {
    if (!state.phoneNumberInput.invalid) return null;
    switch (state.phoneNumberInput.error) {
      case PhoneNumberInputValidationError.empty:
        return S.of(context).pls_input_your_phone_number;
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return MyTextInput(
          focusNode: context.read<RegisterBloc>().emailFocus,
          onChanged: (email) =>
              context.read<RegisterBloc>().add(EmailChanged(email)),
          label: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, RegisterState state) {
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

class _CheckBoxPrivacyAgreement extends StatelessWidget {
  const _CheckBoxPrivacyAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.privacyAgreed != current.privacyAgreed,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.privacyAgreed,
              shape: const CircleBorder(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (checked) {
                context
                    .read<RegisterBloc>()
                    .add(PrivacyAgreedCheckChanged(!state.privacyAgreed));
              },
            ),
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.formStatus.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MyButton(
                title: S.of(context).button_create,
                onPressed: !state.privacyAgreed
                    ? null
                    : () => context
                        .read<RegisterBloc>()
                        .add(const RegisterFormSubmitted()),
              );
      },
    );
  }
}
