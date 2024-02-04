import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../water_supplier_edit/bloc/water_supply_edit_bloc.dart';

class WaterSupplyEditManageView extends StatelessWidget {
  const WaterSupplyEditManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).parameter_code,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000010'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000020'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000030'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000040'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000050'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000060'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000070'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000080'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000090'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000100'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000110'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000120'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000130'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000140'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000150'),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: Text('PA000160'),
          ),
        ],
      ),
    );
  }
}

class WaterSupplyEditManageTextBox extends StatelessWidget {
  const WaterSupplyEditManageTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 50,
            // child: MyTextInput(
            //   // errorText: _handleErrorText(context, state),
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.number,
            // ),
            child: _WQParameter1(),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}

class _WQParameter1 extends StatelessWidget {
  const _WQParameter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wqParameter1 != current.wqParameter1,
      builder: (context, state) {
        return MyTextInput(
          //label: 'អាងអាកាស (m)',
          focusNode: context.read<WaterSupplyEditBloc>().parameter1,
          controller: context.read<WaterSupplyEditBloc>().parameter1Controller,
          onChanged: (val) => context
              .read<WaterSupplyEditBloc>()
              .add(WaterQualityParameterChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }
}
