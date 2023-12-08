import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';

import '../../water_supplier_edit/bloc/water_supply_edit_bloc.dart';

class WaterSupplyEditManageView extends StatelessWidget {
  const WaterSupplyEditManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Visibility(
      visible: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Parameter Code',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000010'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000020'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000030'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000040'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000050'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000060'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000070'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000080'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000090'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000100'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000110'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000120'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000130'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000140'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: Text('PA000150'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
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
    return const Visibility(
      visible: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Value',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            // child: MyTextInput(
            //   // errorText: _handleErrorText(context, state),
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.number,
            // ),
            child: _WQParameter1(),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: MyTextInput(
              // errorText: _handleErrorText(context, state),
              initialValue: '0',
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
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
