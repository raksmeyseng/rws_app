import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/filter/bloc/filter_bloc.dart';
import 'package:rws_app/core/modules/filter_result/view/filter_result_page.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';

class FilterWataerSupplyView extends StatelessWidget {
  const FilterWataerSupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
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
        });
  }
}

// ===================
// Success View
// ===================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Expanded(child: _ConstructionCodeInput()),
                  //   ],
                  // ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ProvinceInput()),
                      SizedBox(width: 16),
                      Expanded(child: _DistrictInput()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _CommuneInput()),
                      SizedBox(width: 16),
                      Expanded(child: _VillageInput()),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          floatingActionButton: const _SearchButton(),
        );
        // if (state.waterSupply.isEmpty) {
        //   return const Center(child: EmptyWidget());
        // }
        // return ListView.separated(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        //   itemBuilder: (context, index) {
        //     return _WaterSupplyItem(state.waterSupply[index]);
        //   },
        //   separatorBuilder: (_, __) => const SizedBox(height: 10),
        //   itemCount: state.waterSupply.length,
        // );
      },
    );
  }
}

// ===================
// Failure View
// ===================s
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
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// class _ConstructionCodeInput extends StatelessWidget {
//   const _ConstructionCodeInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FilterBloc, FilterState>(
//       buildWhen: (previous, current) =>
//           previous.waterSupplyCodeInput != current.waterSupplyCodeInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'លេខកូដសំណង់',
//           focusNode: context.read<FilterBloc>().waterSupplyCodeFocus,
//           controller: context.read<FilterBloc>().waterSupplyCodeController,
//           onChanged: (value) =>
//               context.read<FilterBloc>().add(WaterSupplyCodeChanged(value)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.constructionCodeInput.invalid) return null;
//   switch (state.constructionCodeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលលេខកូដសំណង់';
//     default:
//       return null;
//   }
// }
// }

class _SearchButton extends StatelessWidget {
  const _SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.provinceId != current.provinceId ||
          previous.districtInput != current.districtInput ||
          previous.communeInput != current.communeInput ||
          previous.villageInput != current.villageInput,
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return FilterResultPage(
                    //title: title,
                    waterSupplyTypeId: state.waterSupplyTypeId,
                    waterSupplyCode: state.waterSupplyCodeInput.value,
                    provinceId: state.provinceId,
                    districtId: state.districtInput.value,
                    communeId: state.communeInput.value,
                    villageId: state.villageInput.value,
                  );
                },
              ),
            );
          },
          child: const Icon(Icons.search),
        );
      },
    );
  }
}

class _ProvinceInput extends StatelessWidget {
  const _ProvinceInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.provinceInput != current.provinceInput ||
          previous.provinces != current.provinces,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).province,
          focusNode: context.read<FilterBloc>().provinceFocus,
          controller: context.read<FilterBloc>().provinceController,
          onTap: () async {
            final province =
                await DialogHelper.showAnimatedDialog<ProvinceModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                    title: S.of(context).province,
                    content: SingleChildScrollView(
                      child: Padding(
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
                    ));
              },
            );
            if (province != null) {
              bloc.add(ProvinceChanged(province));
            }
          },
          // isRequired: true,
          // errorText: _handleErrorText(context, state),
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

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.provinceInput.invalid) return null;
  //   switch (state.provinceInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return S.of(context).pls_input_province;
  //     default:
  //       return null;
  //   }
  // }
}

class _DistrictInput extends StatelessWidget {
  const _DistrictInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.districtInput != current.districtInput ||
          previous.districts != current.districts,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).district,
          focusNode: context.read<FilterBloc>().districtFocus,
          controller: context.read<FilterBloc>().districtController,
          onTap: () async {
            if (state.districts.isEmpty) return;
            final district =
                await DialogHelper.showAnimatedDialog<DistrictModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).district,
                  content: SingleChildScrollView(
                    child: Padding(
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
                              title: TextWidget(dis.nameKh),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (district != null) {
              bloc.add(DistrictChanged(district));
            }
          },
          // isRequired: true,
          // errorText: _handleErrorText(context, state),
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

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.districtInput.invalid) return null;
  //   switch (state.districtInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return S.of(context).pls_input_district;
  //     default:
  //       return null;
  //   }
  // }
}

class _CommuneInput extends StatelessWidget {
  const _CommuneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.communeInput != current.communeInput ||
          previous.communes != current.communes,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).commune,
          focusNode: context.read<FilterBloc>().communeFocus,
          controller: context.read<FilterBloc>().communeController,
          onTap: () async {
            if (state.communes.isEmpty) return;
            final commnue =
                await DialogHelper.showAnimatedDialog<CommuneModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).commune,
                  content: SingleChildScrollView(
                    child: Padding(
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
                              title: TextWidget(com.nameKh),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (commnue != null) {
              bloc.add(CommnueChanged(commnue));
            }
          },
          // isRequired: true,
          // errorText: _handleErrorText(context, state),
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

  // String? _handleErrorText(BuildContext context, FilterState state) {
  //   if (!state.communeInput.invalid) return null;
  //   switch (state.communeInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return S.of(context).pls_input_commune;
  //     default:
  //       return null;
  //   }
  // }
}

class _VillageInput extends StatelessWidget {
  const _VillageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.villageInput != current.villageInput ||
          previous.villages != current.villages,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).village,
          focusNode: context.read<FilterBloc>().villageFocus,
          controller: context.read<FilterBloc>().villageController,
          onTap: () async {
            if (state.villages.isEmpty) return;
            final village =
                await DialogHelper.showAnimatedDialog<VillageModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).village,
                  content: SingleChildScrollView(
                    child: Padding(
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
                              title: TextWidget(vill.nameKh),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (village != null) {
              bloc.add(VillageChanged(village));
            }
          },
          // isRequired: true,
          // errorText: _handleErrorText(context, state),
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

  // String? _handleErrorText(BuildContext context, FilterState state) {
  //   if (!state.villageInput.invalid) return null;
  //   switch (state.villageInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return S.of(context).pls_input_village;
  //     default:
  //       return null;
  //   }
  // }
}
