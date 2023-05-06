import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/area_enum.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/budget_type.dart';
import 'package:rws_app/core/enum/management_type.dart';
import 'package:rws_app/core/enum/map_type_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/bloc/water_supply_edit_bloc.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';

import '../../../../utils/helpers/dialog_helper.dart';

class WaterSupplyEditView extends StatelessWidget {
  const WaterSupplyEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BaseStatusEnum.success:
            return const _SuccessView();
          case BaseStatusEnum.failure:
            return const _FailureView();
          default:
            return const _LoadingView();
        }
      },
    );
  }
}

// ===================
// Success View
// ===================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        // if (state.waterSupply == null) {
        //   return const Center(child: EmptyWidget());
        // }
        return DefaultTabController(
          length: 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _TabBar(),
                    Expanded(child: _TabBarView()),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FlatCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: MyButton(
                    title: S.of(context).button_ok,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ===================
// Failure View
// ===================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadDataFailed());
  }
}

// ===================
// Loading View
// ===================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// ======================
// TabBar Widget
// ======================
class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Theme.of(context).primaryColor,
      tabs: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'ទីតាំង'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'ព័ត៌មានផ្សេងៗ'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'QR Code'),
        )
      ],
    );
  }
}

// ======================
// TabBarView Widget
// ======================
class _TabBarView extends StatelessWidget {
  const _TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        _FirstInputPage(),
        _SecondInputPage(),
        _ThirdInputPage(),
      ],
    );
  }
}

class _FirstInputPage extends StatelessWidget {
  const _FirstInputPage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _FormField(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondInputPage extends StatelessWidget {
  const _SecondInputPage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Wrapper(
              maxWidth: appSmallMaxWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // _FormField(),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThirdInputPage extends StatelessWidget {
  const _ThirdInputPage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Wrapper(
              maxWidth: appSmallMaxWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // _FormField(),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ProvinceInput()),
            SizedBox(width: 16),
            Expanded(child: _DistrictInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _CommuneInput()),
            SizedBox(width: 16),
            Expanded(child: _VillageInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _MapTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _LatInput()),
            SizedBox(width: 16),
            Expanded(child: _LongInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _FamilyTotalInput()),
            SizedBox(width: 16),
            Expanded(child: _BudgetTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _LocationRiskInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ManagementTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverTotalInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverFamilyTotalInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverFamilyPoor2Input()),
          ],
        ),
      ],
    );
  }
}

class _ProvinceInput extends StatelessWidget {
  const _ProvinceInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.provinceInput != current.provinceInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).province,
          focusNode: context.read<WaterSupplyEditBloc>().provinceFocus,
          controller: context.read<WaterSupplyEditBloc>().provinceController,
          onTap: () async {
            final province =
                await DialogHelper.showAnimatedDialog<ProvinceModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).province,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...state.provinces.map(
                          (pro) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(pro);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(pro.nameEn),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (province != null) {
              bloc.add(ProvinceChanged(province.nameEn));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.provinceInput.invalid) return null;
    switch (state.provinceInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_province;
      default:
        return null;
    }
  }
}

class _DistrictInput extends StatelessWidget {
  const _DistrictInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.districtInput != current.districtInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).district,
          focusNode: context.read<WaterSupplyEditBloc>().districtFocus,
          controller: context.read<WaterSupplyEditBloc>().districtController,
          onTap: () async {
            final district =
                await DialogHelper.showAnimatedDialog<DistrictModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).district,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...state.districts.map(
                          (dis) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(dis);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(dis.nameEn),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (district != null) {
              bloc.add(DistrictChanged(district.nameEn));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.districtInput.invalid) return null;
    switch (state.districtInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_district;
      default:
        return null;
    }
  }
}

class _CommuneInput extends StatelessWidget {
  const _CommuneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.communeInput != current.communeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).commune,
          focusNode: context.read<WaterSupplyEditBloc>().communeFocus,
          controller: context.read<WaterSupplyEditBloc>().communeController,
          onTap: () async {
            final commnue =
                await DialogHelper.showAnimatedDialog<CommuneModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).commune,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...state.communes.map(
                          (com) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(com);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(com.nameEn),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (commnue != null) {
              bloc.add(CommnueChanged(commnue.nameEn));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.communeInput.invalid) return null;
    switch (state.communeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_commune;
      default:
        return null;
    }
  }
}

class _VillageInput extends StatelessWidget {
  const _VillageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.villageInput != current.villageInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).village,
          focusNode: context.read<WaterSupplyEditBloc>().villageFocus,
          controller: context.read<WaterSupplyEditBloc>().villageController,
          onTap: () async {
            final village =
                await DialogHelper.showAnimatedDialog<VillageModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).village,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...state.villages.map(
                          (vill) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(vill);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(vill.nameEn),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (village != null) {
              bloc.add(VillageChanged(village.nameEn));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.villageInput.invalid) return null;
    switch (state.villageInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_village;
      default:
        return null;
    }
  }
}

class _MapTypeInput extends StatelessWidget {
  const _MapTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.mapTypeInput != current.mapTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ខ្នាតផែនទី',
          focusNode: bloc.mapTypeFocus,
          controller: bloc.mapTypeController,
          onTap: () async {
            final mapType = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ខ្នាតផែនទី',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...MapTypeEnum.values.map(
                          (mapType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(mapType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(mapType.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (mapType != null) {
              bloc.add(MapTypeChanged(mapType));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.mapTypeInput.invalid) return null;
    switch (state.mapTypeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសខ្នាតផែនទី';
      default:
        return null;
    }
  }
}

class _LatInput extends StatelessWidget {
  const _LatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.lateitudeInput != current.lateitudeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'រយៈទទឹង',
          focusNode: context.read<WaterSupplyEditBloc>().latetitudeFocus,
          controller: context.read<WaterSupplyEditBloc>().latetitudeController,
          onChanged: (lat) =>
              context.read<WaterSupplyEditBloc>().add(LatetitudeChanged(lat)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.lateitudeInput.invalid) return null;
    switch (state.lateitudeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលរយៈទទឹង';
      default:
        return null;
    }
  }
}

class _LongInput extends StatelessWidget {
  const _LongInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.longtitudeInput != current.longtitudeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'រយៈបណ្តោយ',
          focusNode: context.read<WaterSupplyEditBloc>().longtitudeFocus,
          controller: context.read<WaterSupplyEditBloc>().longtitudeController,
          onChanged: (long) =>
              context.read<WaterSupplyEditBloc>().add(LongtitudeChanged(long)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.longtitudeInput.invalid) return null;
    switch (state.longtitudeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលរយៈបណ្តោយ';
      default:
        return null;
    }
  }
}

class _FamilyTotalInput extends StatelessWidget {
  const _FamilyTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.familyTotalInput != current.familyTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'គ្រួសារសរុប',
          focusNode: context.read<WaterSupplyEditBloc>().familyTotalFocus,
          controller: context.read<WaterSupplyEditBloc>().familyTotalController,
          onChanged: (total) => context
              .read<WaterSupplyEditBloc>()
              .add(FamilyTotalChanged(total)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.familyTotalInput.invalid) return null;
    switch (state.familyTotalInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលគ្រួសារសរុប';
      default:
        return null;
    }
  }
}

class _LocationRiskInput extends StatelessWidget {
  const _LocationRiskInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.locationRickInput != current.locationRickInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'តំបន់ប្រឈមផ្នែកបរិស្ថាន',
          focusNode: context.read<WaterSupplyEditBloc>().locationRickFocus,
          controller:
              context.read<WaterSupplyEditBloc>().locationRickController,
          onTap: () async {
            final area = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'តំបន់ប្រឈមផ្នែកបរិស្ថាន',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...AreaEnum.values.map(
                          (areaType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(areaType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(areaType.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (area != null) {
              bloc.add(LocationRickChanged(area));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.locationRickInput.invalid) return null;
    switch (state.locationRickInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសតំបន់ប្រឈមផ្នែកបរិស្ថាន';
      default:
        return null;
    }
  }
}

class _BudgetTypeInput extends StatelessWidget {
  const _BudgetTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.budgetTypeInput != current.budgetTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ប្រភេទថវិកា',
          focusNode: context.read<WaterSupplyEditBloc>().budgetTypeFocus,
          controller: context.read<WaterSupplyEditBloc>().budgetTypeController,
          onTap: () async {
            final budget = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ប្រភេទថវិកា',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...BudgetTypeEnum.values.map(
                          (budgetType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(budgetType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title:
                                TextWidget(budgetType.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (budget != null) {
              bloc.add(BudgetTypeChanged(budget));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.budgetTypeInput.invalid) return null;
    switch (state.budgetTypeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសប្រភេទថវិកា';
      default:
        return null;
    }
  }
}

class _ManagementTypeInput extends StatelessWidget {
  const _ManagementTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.managementTypeInput != current.managementTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ប្រភេទនៃការគ្រប់គ្រង',
          focusNode: context.read<WaterSupplyEditBloc>().managementTypeFocus,
          controller:
              context.read<WaterSupplyEditBloc>().managementTypeController,
          onTap: () async {
            final manage = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ប្រភេទនៃការគ្រប់គ្រង',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...ManagementTypeEnum.values.map(
                          (manageType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(manageType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title:
                                TextWidget(manageType.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (manage != null) {
              bloc.add(ManagementTypeChanged(manage));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.managementTypeInput.invalid) return null;
    switch (state.managementTypeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសប្រភេទនៃការគ្រប់គ្រង';
      default:
        return null;
    }
  }
}

class _ReceiverTotalInput extends StatelessWidget {
  const _ReceiverTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverTotalInput != current.receiverTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលសរុប',
          focusNode: context.read<WaterSupplyEditBloc>().receiverTotalFocus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverTotalController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverTotalChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverTotalInput.invalid) return null;
    switch (state.receiverTotalInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលសរុប';
      default:
        return null;
    }
  }
}

class _ReceiverFamilyTotalInput extends StatelessWidget {
  const _ReceiverFamilyTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyTotalInput != current.receiverFamilyTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលគ្រួសារសរុប',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyTotalFocus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyTotalController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyTotalChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyTotalInput.invalid) return null;
    switch (state.receiverFamilyTotalInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលគ្រួសារសរុប';
      default:
        return null;
    }
  }
}

class _ReceiverFamilyPoor2Input extends StatelessWidget {
  const _ReceiverFamilyPoor2Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyPoor2Input != current.receiverFamilyPoor2Input,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលគ្រួសារក្រ២',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor2Focus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor2Controller,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyPoor2Changed(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyPoor2Input.invalid) return null;
    switch (state.receiverFamilyPoor2Input.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលគ្រួសារក្រ២';
      default:
        return null;
    }
  }
}
