import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/report/bloc/report_bloc.dart';
import 'package:rws_app/core/modules/report/view/report_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../../config/themes/app_color.dart';
import '../../../../translation/generated/l10n.dart';
import '../../../enum/base_status_enum.dart';
import '../repositories/report_repository.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  //final ReportRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportBloc(ReportRepository())
      ..add(const ReportEventStated()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: TextWidget(
              S.of(context).report,
              color: AppColor.white,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          //body: const ReportView(),
          body: const EmptyWidget(),
        ),
      );

    

    
  }
}

