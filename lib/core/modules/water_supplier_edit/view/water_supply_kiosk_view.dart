part of 'water_supply_edit_view.dart';

class _AbilityProductWaterInput extends StatelessWidget {
  const _AbilityProductWaterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.abilityProduceWaterInput != current.abilityProduceWaterInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'សមត្ថភាពផលិតទឹក(ចំនួនប៊ីដុង/មួយថ្ងៃ)',
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
}

class _KioskStatusInput extends StatelessWidget {
  const _KioskStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.kioskStatus != current.kioskStatus,
      builder: (context, state) {
        return MyTextInput(
          label: 'ស្ថានភាពស្ថានីយ',
          focusNode: bloc.kioskStatusFocus,
          controller: bloc.kioskStatusController,
          onTap: () async {
            final pondType = await DialogHelper.showAnimatedDialog<WellStatusEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ស្ថានភាពស្ថានីយ',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellStatusEnum.values.map(
                          (pondType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(pondType);
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
              bloc.add(KioskStatusChanged(pondType));
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
}

class _KioskFilterInput extends StatelessWidget {
  const _KioskFilterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.kioskFilter != current.kioskFilter,
      builder: (context, state) {
        return MyTextInput(
          label: 'អាងចម្រោះ',
          focusNode: bloc.kioskFilterFocus,
          controller: bloc.kioskFilterController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<FilterEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'អាងចម្រោះ',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...FilterEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(status);
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
              bloc.add(KioskFilterChanged(type));
            }
          },
          
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

}

