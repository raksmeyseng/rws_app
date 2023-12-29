part of 'water_supply_edit_view.dart';

class _WaterSupplyTypeInput extends StatelessWidget {
  const _WaterSupplyTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.waterSupplyTypeInput != current.waterSupplyTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).source_type_of_water,
          focusNode: bloc.waterSupplyTypeFocus,
          controller: bloc.waterSupplyTypeController,
          onTap: () async {
            final waterSupplyType =
                await DialogHelper.showAnimatedDialog<WaterSupplyTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).source_type_of_water,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WaterSupplyTypeEnum.values.map(
                          (waterSupplyType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(waterSupplyType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(waterSupplyType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (waterSupplyType != null) {
              bloc.add(WaterSupplyTypeChanged(waterSupplyType));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.waterSupplyTypeInput.invalid) return null;
    switch (state.waterSupplyTypeInput.error) {
      case WaterSupplyTypeInputValidationError.empty:
        return 'សូមជ្រើសរើសប្រភេទប្រភពទឹក';
      default:
        return null;
    }
  }
}

class _ContainerInput extends StatelessWidget {
  const _ContainerInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.containerInput != current.containerInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).underground_pool_storage,
          focusNode: context.read<WaterSupplyEditBloc>().containerFocus,
          controller: context.read<WaterSupplyEditBloc>().containerController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(ContainerChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.containerInput.invalid) return null;
  //   switch (state.containerInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលអាងស្តុបទឹកក្រោមដី(m3)';
  //     default:
  //       return null;
  //   }
  // }
}

class _CapacityInput extends StatelessWidget {
  const _CapacityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.capacityInput != current.capacityInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).abilty_of_produce_water,
          focusNode: context.read<WaterSupplyEditBloc>().capacityFocus,
          controller: context.read<WaterSupplyEditBloc>().capacityController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(CapacityChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.capacityInput.invalid) return null;
  //   switch (state.capacityInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលសមត្ថភាពផលិតទឹក(m3/h)';
  //     default:
  //       return null;
  //   }
  // }
}

class _AirPoolInput extends StatelessWidget {
  const _AirPoolInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.airPoolInput != current.airPoolInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).pool_air,
          focusNode: context.read<WaterSupplyEditBloc>().ariPoolFocus,
          controller: context.read<WaterSupplyEditBloc>().ariPoolController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(AirPoolChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.airPoolInput.invalid) return null;
  //   switch (state.airPoolInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលអាងអាកាស (m)';
  //     default:
  //       return null;
  //   }
  // }
}

class _FilterTankInput extends StatelessWidget {
  const _FilterTankInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.filterTankInput != current.filterTankInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).pool_filter,
          focusNode: bloc.filterTankFocus,
          controller: bloc.filterTankController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<FilterEnum?>(
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
                        ...FilterEnum.values.map(
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
              bloc.add(FilterTankChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.filterTankInput.invalid) return null;
    switch (state.filterTankInput.error) {
      case FilterInputValidationError.empty:
        return 'សូមជ្រើសរើសអាងចម្រោះ';
      default:
        return null;
    }
  }
}

class _ConnectorInput extends StatelessWidget {
  const _ConnectorInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.connectorInput != current.connectorInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).number_of_link,
          focusNode: context.read<WaterSupplyEditBloc>().connectorFocus,
          controller: context.read<WaterSupplyEditBloc>().connectorController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(ConnectorChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.connectorInput.invalid) return null;
  //   switch (state.connectorInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលចំនួនតំណដែលបានត';
  //     default:
  //       return null;
  //   }
  // }
}

class _PipeLenghtInput extends StatelessWidget {
  const _PipeLenghtInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pipeLenghtInput != current.pipeLenghtInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).pipe_length,
          focusNode: context.read<WaterSupplyEditBloc>().pipeLenghtFocus,
          controller: context.read<WaterSupplyEditBloc>().pipeLenghtController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(PipeLenghtChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.pipeLenghtInput.invalid) return null;
  //   switch (state.pipeLenghtInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលប្រវែងបណ្តោយទុយោមេ (m)';
  //     default:
  //       return null;
  //   }
  // }
}

class _CoverageInput extends StatelessWidget {
  const _CoverageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.coverageInput != current.coverageInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).area_covering,
          focusNode: context.read<WaterSupplyEditBloc>().coverageFocus,
          controller: context.read<WaterSupplyEditBloc>().coverageController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(CoverageChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.coverageInput.invalid) return null;
  //   switch (state.coverageInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលភូមិ/ឃុំគ្របដណ្តប់';
  //     default:
  //       return null;
  //   }
  // }
}

class _PipeStatusInput extends StatelessWidget {
  const _PipeStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.pipeStatusInput != current.pipeStatusInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).status_pipe,
          focusNode: bloc.pipeStatusFocus,
          controller: bloc.pipeStatusController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<WellStatusEnum?>(
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
                        ...WellStatusEnum.values.map(
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
              bloc.add(PipeStatusChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.pipeStatusInput.invalid) return null;
    switch (state.pipeStatusInput.error) {
      case WellStatusInputValidationError.empty:
        return 'សូមជ្រើសរើសស្ថានភាពបណ្តាញទឹក';
      default:
        return null;
    }
  }
}
