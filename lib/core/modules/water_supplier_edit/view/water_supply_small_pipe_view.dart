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
          label: 'ប្រភេទប្រភពទឹក',
          focusNode: bloc.waterSupplyTypeFocus,
          controller: bloc.waterSupplyTypeController,
          onTap: () async {
            final waterSupplyType =
                await DialogHelper.showAnimatedDialog<WaterSupplyTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ប្រភេទប្រភពទឹក',
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
          label: 'អាងស្តុបទឹកក្រោមដី(m3)',
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