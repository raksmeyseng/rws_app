part of 'water_supply_edit_view.dart';

class _PondLatInput extends StatelessWidget {
  const _PondLatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondLatInput != current.pondLatInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).width,
          focusNode: context.read<WaterSupplyEditBloc>().pondLatFocus,
          controller: context.read<WaterSupplyEditBloc>().pondLatController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(PondLatChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondLatInput.invalid) return null;
  //   switch (state.pondLatInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលទទឹងស្រះ (ម៉ែត្រ)';
  //     default:
  //       return null;
  //   }
  // }
}

class _PondLongInput extends StatelessWidget {
  const _PondLongInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondLongInput != current.pondLongInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).length,
          focusNode: context.read<WaterSupplyEditBloc>().pondLongFocus,
          controller: context.read<WaterSupplyEditBloc>().pondLongController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(PondLongChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondLongInput.invalid) return null;
  //   switch (state.pondLongInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលបណ្តោយស្រះ (ម៉ែត្រ)';
  //     default:
  //       return null;
  //   }
  // }
}

class _PondDepthInput extends StatelessWidget {
  const _PondDepthInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondDepthInput != current.pondDepthInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).height,
          focusNode: context.read<WaterSupplyEditBloc>().pondDepthFocus,
          controller: context.read<WaterSupplyEditBloc>().pondDepthController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(PondDepthChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondDepthInput.invalid) return null;
  //   switch (state.pondDepthInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលជម្រៅស្រះ (ម៉ែត្រ)';
  //     default:
  //       return null;
  //   }
  // }
}

class _PondFilterInput extends StatelessWidget {
  const _PondFilterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondFilterInput != current.pondFilterInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).pool_filter,
          focusNode: bloc.pondFilterFocus,
          controller: bloc.pondFilterController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<PondFilterEnum?>(
              //  final type = await DialogHelper.showAnimatedDialog<FilterEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).pool_filter,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...PondFilterEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(PondFilterChanged(type));
              //bloc.add(FilterTankChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondFilterInput.invalid) return null;
  //   switch (state.pondFilterInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមជ្រើសរើសអាងចម្រោះ';
  //     default:
  //       return null;
  //   }
  // }
}

class _PondTypeInput extends StatelessWidget {
  const _PondTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondTypeInput != current.pondTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).type_of_pond,
          focusNode: bloc.pondTypeFocus,
          controller: bloc.pondTypeController,
          onTap: () async {
            final pondType =
                await DialogHelper.showAnimatedDialog<PondTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).type_of_pond,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...PondTypeEnum.values.map(
                          (pondType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(pondType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(pondType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (pondType != null) {
              bloc.add(PondTypeChanged(pondType));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondTypeInput.invalid) return null;
  //   switch (state.pondTypeInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមជ្រើសរើសប្រភេទស្រះ';
  //     default:
  //       return null;
  //   }
  // }
}

class _SeasonInput extends StatelessWidget {
  const _SeasonInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.seasonInput != current.seasonInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).is_summer_has_water,
          focusNode: bloc.seasonFocus,
          controller: bloc.seasonController,
          onTap: () async {
            final seasonHasWater =
                await DialogHelper.showAnimatedDialog<SeasonEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).is_summer_has_water,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...SeasonEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (seasonHasWater != null) {
              bloc.add(SeasonChanged(seasonHasWater));
            }
          },
          //errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.seasonInput.invalid) return null;
  //   switch (state.seasonInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមជ្រើសរើសរដូវប្រាំង';
  //     default:
  //       return null;
  //   }
  // }
}

class _PondStatusInput extends StatelessWidget {
  const _PondStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pondStatusInput != current.pondStatusInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).status_pipe,
          focusNode: bloc.pondStatusFocus,
          controller: bloc.pondStatusController,
          onTap: () async {
            final pondType =
                await DialogHelper.showAnimatedDialog<PondStatusEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).status_pipe,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...PondStatusEnum.values.map(
                          (pondType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(pondType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(pondType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (pondType != null) {
              bloc.add(PondStatusChanged(pondType));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pondStatusInput.invalid) return null;
  //   switch (state.pondStatusInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមជ្រើសរើសស្ថានភាពស្រះ';
  //     default:
  //       return null;
  //   }
  // }
}
