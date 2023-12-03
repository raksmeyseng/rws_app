import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/filter/bloc/filter_bloc.dart';
import 'package:rws_app/core/modules/filter_result/view/filter_result_page.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';

class FilterWataerSupplyView extends StatelessWidget {
  const FilterWataerSupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ConstructionCodeInput()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return FilterResultPage(
                      //title: title,
                      waterSupplyTypeId: state.waterSupplyTypeId,
                      waterSupplyCode: state.waterSupplyCodeInput.value,
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
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

class _ConstructionCodeInput extends StatelessWidget {
  const _ConstructionCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) =>
          previous.waterSupplyCodeInput != current.waterSupplyCodeInput,
      builder: (context, state) {
        return MyTextInput(
          label: 'លេខកូដសំណង់',
          focusNode: context.read<FilterBloc>().waterSupplyCodeFocus,
          controller: context.read<FilterBloc>().waterSupplyCodeController,
          onChanged: (value) =>
              context.read<FilterBloc>().add(WaterSupplyCodeChanged(value)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.constructionCodeInput.invalid) return null;
  //   switch (state.constructionCodeInput.error) {
  //     case WaterSupplyInputValidationError.empty:
  //       return 'សូមបញ្ចូលលេខកូដសំណង់';
  //     default:
  //       return null;
  //   }
  // }
}
