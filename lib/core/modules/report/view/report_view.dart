import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/report/bloc/report_bloc.dart';

import '../../../../config/themes/app_color.dart';
import '../../../../translation/generated/l10n.dart';
import '../../../widgets/text_widget.dart';

class ReportView extends StatelessWidget{
  const ReportView({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc,ReportState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context,state){
        
        return const _LoadingView();
      });
  }
}

// ===================
// Loading View
// ===================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}