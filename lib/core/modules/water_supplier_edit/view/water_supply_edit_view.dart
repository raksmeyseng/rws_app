import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/area_enum.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/budget_type.dart';
import 'package:rws_app/core/enum/check_water_quality_enum.dart';
import 'package:rws_app/core/enum/management_type.dart';
import 'package:rws_app/core/enum/map_type_enum.dart';
import 'package:rws_app/core/enum/water_quality_enum.dart';
import 'package:rws_app/core/enum/water_supply_type_enum.dart';
import 'package:rws_app/core/enum/well_status_enum.dart';
import 'package:rws_app/core/enum/well_type_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/bloc/water_supply_edit_bloc.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/doc_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';

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
          child: Tab(text: 'ប្រព័ន្ធផ្គត់ផ្គង់ទឹក'),
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
                _FormField1(),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _FormField2(),
              ],
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _FormField3(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormField1 extends StatelessWidget {
  const _FormField1({Key? key}) : super(key: key);

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
        const _MapTypeDynamicForm(),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _FormField2 extends StatelessWidget {
  const _FormField2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
            Expanded(child: _ManagamentNameInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverTotalInput()),
            SizedBox(width: 16),
            Expanded(child: _ReceiverTotalAsFemaleInput()),
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
            Expanded(child: _ReceiverFamilyPoor1Input()),
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
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverFamilyMinorityInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ReceiverFamilyVictimInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ConstructionCodeInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _DateOfConstructionInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _CompanyNameInput()),
          ],
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _FormField3 extends StatelessWidget {
  const _FormField3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      builder: (context, state) {
        switch (state.waterSupplyId) {
          case 1:
            return const _WellInputPage();
          case 2:
            return const _PipeInputPage();
          case 3:
            return const _KoiskInputPage();
          case 4:
            return const _PondInputPage();
          case 5:
            return const _RainInputPage();
          case 6:
            return const _SmallPipeInputPage();
          case 7:
            return const _AirInputPage();
          default:
            return const _WellInputPage();
        }
      },
    );
  }
}

class _WellInputPage extends StatelessWidget {
  const _WellInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _WellTypeInput()),
            SizedBox(width: 16),
            Expanded(child: _WellDepthInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _WellScreenInput()),
            SizedBox(width: 16),
            Expanded(child: _WellThearInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _NiVoStaticInput()),
            SizedBox(width: 16),
            Expanded(child: _NiVoDynamicInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _WaterQualityInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _CheckWaterQualityInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _WellStatusInput()),
          ],
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _PipeInputPage extends StatelessWidget {
  const _PipeInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _WaterSupplyTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _ContainerInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _CapacityInput()),
          ],
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _KoiskInputPage extends StatelessWidget {
  const _KoiskInputPage({Key? key}) : super(key: key);

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
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _PondInputPage extends StatelessWidget {
  const _PondInputPage({Key? key}) : super(key: key);

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
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _RainInputPage extends StatelessWidget {
  const _RainInputPage({Key? key}) : super(key: key);

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
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _SmallPipeInputPage extends StatelessWidget {
  const _SmallPipeInputPage({Key? key}) : super(key: key);

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
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _AirInputPage extends StatelessWidget {
  const _AirInputPage({Key? key}) : super(key: key);

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
        //bottom padding
        const SizedBox(height: 30),
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

class _MapTypeDynamicForm extends StatelessWidget {
  const _MapTypeDynamicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.mapTypeInput != current.mapTypeInput,
      builder: (context, state) {
        final mapTypeEnum = getEnumByString(state.mapTypeInput.value);
        switch (mapTypeEnum) {
          case MapTypeEnum.utm:
            return const _UtmForm();
          case MapTypeEnum.decimal:
            return const _DecimalForm();
          case MapTypeEnum.degree:
            return const _DegreeForm();
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class _UtmForm extends StatelessWidget {
  const _UtmForm();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(child: _LatInput()),
        SizedBox(width: 16),
        Expanded(child: _LongInput()),
      ],
    );
  }
}

class _DecimalForm extends StatelessWidget {
  const _DecimalForm();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(child: _UTMXInput()),
        SizedBox(width: 16),
        Expanded(child: _UTMYInput()),
      ],
    );
  }
}

class _DegreeForm extends StatelessWidget {
  const _DegreeForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CaptionWidget('រយៈទទឹង'),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _LatDegreeInput()),
            SizedBox(width: 16),
            Expanded(child: _LatMinuteInput()),
            SizedBox(width: 16),
            Expanded(child: _LatSecondInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CaptionWidget('រយៈបណ្តោយ'),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _LongDegreeInput()),
            SizedBox(width: 16),
            Expanded(child: _LongMinuteInput()),
            SizedBox(width: 16),
            Expanded(child: _LongSecondInput()),
          ],
        ),
      ],
    );
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
          keyboardType: TextInputType.phone,
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
          keyboardType: TextInputType.phone,
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

class _UTMXInput extends StatelessWidget {
  const _UTMXInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.utmXInput != current.utmXInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'កូអរដោនេ UTMX',
          focusNode: context.read<WaterSupplyEditBloc>().utmXFocus,
          controller: context.read<WaterSupplyEditBloc>().utmXController,
          onChanged: (y) =>
              context.read<WaterSupplyEditBloc>().add(UTMXChanged(y)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.utmXInput.invalid) return null;
    switch (state.utmXInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលកូអរដោនេ UTMX';
      default:
        return null;
    }
  }
}

class _UTMYInput extends StatelessWidget {
  const _UTMYInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.utmYInput != current.utmYInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'កូអរដោនេ UTMY',
          focusNode: context.read<WaterSupplyEditBloc>().utmYFocus,
          controller: context.read<WaterSupplyEditBloc>().utmYController,
          onChanged: (y) =>
              context.read<WaterSupplyEditBloc>().add(UTMYChanged(y)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.utmYInput.invalid) return null;
    switch (state.utmYInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលកូអរដោនេ UTMY';
      default:
        return null;
    }
  }
}

class _LatDegreeInput extends StatelessWidget {
  const _LatDegreeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.latDegreeInput != current.latDegreeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Degree',
          focusNode: context.read<WaterSupplyEditBloc>().latDegreeFocus,
          controller: context.read<WaterSupplyEditBloc>().latDegreeController,
          onChanged: (degree) =>
              context.read<WaterSupplyEditBloc>().add(LatDegreeChanged(degree)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.latDegreeInput.invalid) return null;
    switch (state.latDegreeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Degree';
      default:
        return null;
    }
  }
}

class _LatSecondInput extends StatelessWidget {
  const _LatSecondInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.latSecondInput != current.latSecondInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Second',
          focusNode: context.read<WaterSupplyEditBloc>().latSecondFocus,
          controller: context.read<WaterSupplyEditBloc>().latSecondController,
          onChanged: (sec) =>
              context.read<WaterSupplyEditBloc>().add(LatSecondChanged(sec)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.latSecondInput.invalid) return null;
    switch (state.latSecondInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Second';
      default:
        return null;
    }
  }
}

class _LongDegreeInput extends StatelessWidget {
  const _LongDegreeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.longDegreeInput != current.longDegreeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Degree',
          focusNode: context.read<WaterSupplyEditBloc>().longDegreeFocus,
          controller: context.read<WaterSupplyEditBloc>().longDegreeController,
          onChanged: (degree) => context
              .read<WaterSupplyEditBloc>()
              .add(LongDegreeChanged(degree)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.longDegreeInput.invalid) return null;
    switch (state.longDegreeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Degree';
      default:
        return null;
    }
  }
}

class _LongSecondInput extends StatelessWidget {
  const _LongSecondInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.longSecondInput != current.longSecondInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Second',
          focusNode: context.read<WaterSupplyEditBloc>().longSecondFocus,
          controller: context.read<WaterSupplyEditBloc>().longSecondController,
          onChanged: (sec) =>
              context.read<WaterSupplyEditBloc>().add(LongSecondChanged(sec)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.longSecondInput.invalid) return null;
    switch (state.longSecondInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Second';
      default:
        return null;
    }
  }
}

class _LatMinuteInput extends StatelessWidget {
  const _LatMinuteInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.latMinuteInput != current.latMinuteInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Minute',
          focusNode: context.read<WaterSupplyEditBloc>().latMinuteFocus,
          controller: context.read<WaterSupplyEditBloc>().latMinuteController,
          onChanged: (min) =>
              context.read<WaterSupplyEditBloc>().add(LatMinuteChanged(min)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.latMinuteInput.invalid) return null;
    switch (state.latMinuteInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Minute';
      default:
        return null;
    }
  }
}

class _LongMinuteInput extends StatelessWidget {
  const _LongMinuteInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.longMinuteInput != current.longMinuteInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'Minute',
          focusNode: context.read<WaterSupplyEditBloc>().longMinuteFocus,
          controller: context.read<WaterSupplyEditBloc>().longMinuteController,
          onChanged: (min) =>
              context.read<WaterSupplyEditBloc>().add(LongMinuteChanged(min)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.longMinuteInput.invalid) return null;
    switch (state.longMinuteInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូល Minute';
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
          keyboardType: TextInputType.phone,
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

class _ManagamentNameInput extends StatelessWidget {
  const _ManagamentNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.managementNameInput != current.managementNameInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ឈ្មោះអ្នកគ្រប់គ្រង',
          focusNode: context.read<WaterSupplyEditBloc>().managementNameFocus,
          controller:
              context.read<WaterSupplyEditBloc>().managementNameController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ManagementNameChanged(value)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.managementNameInput.invalid) return null;
    switch (state.managementNameInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលឈ្មោះអ្នកគ្រប់គ្រង';
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
          keyboardType: TextInputType.phone,
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

class _ReceiverTotalAsFemaleInput extends StatelessWidget {
  const _ReceiverTotalAsFemaleInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverTotalAsFemaleInput !=
          current.receiverTotalAsFemaleInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលសរុបស្រី',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverTotalAsFemaleFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverTotalAsFemaleController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverTotalAsFemaleChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverTotalAsFemaleInput.invalid) return null;
    switch (state.receiverTotalAsFemaleInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលសរុបស្រី';
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
          keyboardType: TextInputType.phone,
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

class _ReceiverFamilyPoor1Input extends StatelessWidget {
  const _ReceiverFamilyPoor1Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyPoor1Input != current.receiverFamilyPoor1Input,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលគ្រួសារក្រ១',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor1Focus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor1Controller,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyPoor1Changed(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyPoor1Input.invalid) return null;
    switch (state.receiverFamilyPoor1Input.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលគ្រួសារក្រ១';
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
          keyboardType: TextInputType.phone,
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

class _ReceiverFamilyMinorityInput extends StatelessWidget {
  const _ReceiverFamilyMinorityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyMinorityInput !=
          current.receiverFamilyMinorityInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលគ្រួសារជនជាតិភាគតិច',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyMinorityFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverFamilyMinorityController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyMinorityChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyMinorityInput.invalid) return null;
    switch (state.receiverFamilyMinorityInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលជនជាតិភាគតិច';
      default:
        return null;
    }
  }
}

class _ReceiverFamilyVictimInput extends StatelessWidget {
  const _ReceiverFamilyVictimInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyVictimInput !=
          current.receiverFamilyVictimInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'អ្នកទទួលផលគ្រួសារជនងាយរងគ្រោះ',
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyVictimFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverFamilyVictimController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyVictimChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyVictimInput.invalid) return null;
    switch (state.receiverFamilyVictimInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអ្នកទទួលផលគ្រួសារជនងាយរងគ្រោះ';
      default:
        return null;
    }
  }
}

class _DateOfConstructionInput extends StatelessWidget {
  const _DateOfConstructionInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.docInput != current.docInput,
      builder: (context, state) {
        final bloc = context.read<WaterSupplyEditBloc>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextInput(
              label: 'កាលបរិច្ឆេទសំណង់',
              controller: context.read<WaterSupplyEditBloc>().docController,
              onTap: () async {
                final date = await _pickDate(context);
                if (date != null) {
                  bloc.add(DOCChanged(date));
                }
              },
              readOnly: true,
              isRequired: true,
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
              errorText: _handleErrorText(context, state),
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.docInput.invalid) return null;
    switch (state.docInput.error) {
      case DOCInputValidationError.empty:
        return 'សូមជ្រើសរើសកាលបរិច្ឆេទសំណង់';
      default:
        return null;
    }
  }

  Future<DateTime?> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: context.read<WaterSupplyEditBloc>().state.docInput.value ??
          DateTime.now(),
      firstDate: DateHelper.calendarFirstDate(),
      lastDate: DateHelper.calendarLastDate(),
    );
    return date;
  }
}

class _CompanyNameInput extends StatelessWidget {
  const _CompanyNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.companyNameInput != current.companyNameInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'សាងសង់ដោយក្រុមហ៊ុន',
          focusNode: context.read<WaterSupplyEditBloc>().companyNameFocus,
          controller: context.read<WaterSupplyEditBloc>().companyNameController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(CompanyNameChanged(value)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.companyNameInput.invalid) return null;
    switch (state.companyNameInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលសាងសង់ដោយក្រុមហ៊ុន';
      default:
        return null;
    }
  }
}

class _ConstructionCodeInput extends StatelessWidget {
  const _ConstructionCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.constructionCodeInput != current.constructionCodeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'លេខកូដសំណង់',
          focusNode: context.read<WaterSupplyEditBloc>().constructionCodeFocus,
          controller:
              context.read<WaterSupplyEditBloc>().constructionCodeController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ConstructionCodeChanged(value)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.constructionCodeInput.invalid) return null;
    switch (state.constructionCodeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលលេខកូដសំណង់';
      default:
        return null;
    }
  }
}

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
                await DialogHelper.showAnimatedDialog<String?>(
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
                              Navigator.of(context)
                                  .pop(waterSupplyType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(
                                waterSupplyType.getDisplayText(context)),
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
      case WaterSupplyInputValidationError.empty:
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
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.containerInput.invalid) return null;
    switch (state.containerInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលអាងស្តុបទឹកក្រោមដី(m3)';
      default:
        return null;
    }
  }
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
          label: 'សមត្ថភាពផលិតទឹក(m3/h)',
          focusNode: context.read<WaterSupplyEditBloc>().capacityFocus,
          controller: context.read<WaterSupplyEditBloc>().capacityController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(CapacityChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.capacityInput.invalid) return null;
    switch (state.capacityInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលសមត្ថភាពផលិតទឹក(m3/h)';
      default:
        return null;
    }
  }
}

class _WellTypeInput extends StatelessWidget {
  const _WellTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellTypeInput != current.wellTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ប្រភេទអណ្តូង',
          focusNode: bloc.wellTypeFocus,
          controller: bloc.wellTypeController,
          onTap: () async {
            final wellType = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ប្រភេទអណ្តូង',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellTypeEnum.values.map(
                          (wellType) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(wellType.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(wellType.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (wellType != null) {
              bloc.add(WellTypeChanged(wellType));
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
    if (!state.wellTypeInput.invalid) return null;
    switch (state.wellTypeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសប្រភេទអណ្តូង';
      default:
        return null;
    }
  }
}

class _WellDepthInput extends StatelessWidget {
  const _WellDepthInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellDepthInput != current.wellDepthInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ជម្រៅអណ្តូង(m)',
          focusNode: context.read<WaterSupplyEditBloc>().wellDepthFocus,
          controller: context.read<WaterSupplyEditBloc>().wellDepthController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellDepthChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.wellDepthInput.invalid) return null;
    switch (state.wellDepthInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលជម្រៅអណ្តូង(m)';
      default:
        return null;
    }
  }
}

class _WellScreenInput extends StatelessWidget {
  const _WellScreenInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellScreenInput != current.wellScreenInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ជម្រៅតម្រង (Screen) (m)',
          focusNode: context.read<WaterSupplyEditBloc>().wellScreenFocus,
          controller: context.read<WaterSupplyEditBloc>().wellScreenController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellScreenChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.wellScreenInput.invalid) return null;
    switch (state.wellScreenInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលជម្រៅតម្រង (Screen) (m)';
      default:
        return null;
    }
  }
}

class _WellThearInput extends StatelessWidget {
  const _WellThearInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellThearInput != current.wellThearInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ធារទឹក (m3/h)',
          focusNode: context.read<WaterSupplyEditBloc>().wellThearFocus,
          controller: context.read<WaterSupplyEditBloc>().wellThearController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellThearChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.wellThearInput.invalid) return null;
    switch (state.wellThearInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលធារទឹក (m3/h)';
      default:
        return null;
    }
  }
}

class _WaterQualityInput extends StatelessWidget {
  const _WaterQualityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.waterQualityInput != current.waterQualityInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'គុណភាពទឹក',
          focusNode: bloc.waterQualityFocus,
          controller: bloc.waterQualityController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'គុណភាពទឹក',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WaterQualityEnum.values.map(
                          (quality) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(quality.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(quality.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(WaterQualityChanged(type));
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
    if (!state.waterQualityInput.invalid) return null;
    switch (state.waterQualityInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសគុណភាពទឹក';
      default:
        return null;
    }
  }
}

class _NiVoStaticInput extends StatelessWidget {
  const _NiVoStaticInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.niVoStaticInput != current.niVoStaticInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'នីវ៉ូស្តាទិច (m)',
          focusNode: context.read<WaterSupplyEditBloc>().niVoStaticFocus,
          controller: context.read<WaterSupplyEditBloc>().niVoStaticController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(NiVoStaticChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.niVoStaticInput.invalid) return null;
    switch (state.niVoStaticInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលនីវ៉ូស្តាទិច (m)';
      default:
        return null;
    }
  }
}

class _NiVoDynamicInput extends StatelessWidget {
  const _NiVoDynamicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.niVoDynamicInput != current.niVoDynamicInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'នីវ៉ូឌីណាមិច (m)',
          focusNode: context.read<WaterSupplyEditBloc>().niVoDynamicFocus,
          controller: context.read<WaterSupplyEditBloc>().niVoDynamicController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(NiVoDynamicChanged(val)),
          errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.niVoDynamicInput.invalid) return null;
    switch (state.niVoDynamicInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមបញ្ចូលនីវ៉ូឌីណាមិច (m)';
      default:
        return null;
    }
  }
}

class _CheckWaterQualityInput extends StatelessWidget {
  const _CheckWaterQualityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.checkWaterQualityInput != current.checkWaterQualityInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ត្រួតពិនិត្យគុណភាពទឹក',
          focusNode: bloc.checkWaterQualityFocus,
          controller: bloc.checkWaterQualityController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ត្រួតពិនិត្យគុណភាពទឹក',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...CheckWaterQualityEnum.values.map(
                          (check) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(check.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(check.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(CheckWaterQualityChanged(type));
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
    if (!state.checkWaterQualityInput.invalid) return null;
    switch (state.checkWaterQualityInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសត្រួតពិនិត្យគុណភាពទឹក';
      default:
        return null;
    }
  }
}

class _WellStatusInput extends StatelessWidget {
  const _WellStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellStatusInput != current.wellStatusInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'ស្ថានភាពអណ្តូង',
          focusNode: bloc.wellStatusFocus,
          controller: bloc.wellStatusController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<String?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: 'ស្ថានភាពអណ្តូង',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellStatusEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(status.getDisplayText(context));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(WellStatusChanged(type));
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
    if (!state.wellStatusInput.invalid) return null;
    switch (state.wellStatusInput.error) {
      case WaterSupplyInputValidationError.empty:
        return 'សូមជ្រើសរើសស្ថានភាពអណ្តូង';
      default:
        return null;
    }
  }
}
