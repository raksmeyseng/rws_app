import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/report/bloc/report_bloc.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

import '../../../../config/themes/app_color.dart';
import '../../../../translation/generated/l10n.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportBloc(

      )..add(const ReportEventStated()),
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
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                
              ],
            ),
          ),
        ),
      );

    // return BlocBuilder<ReportBloc,ReportState>(
    //   buildWhen: (previous, current) => previous != current,
    //   builder: (context,stae){
    //     return Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Theme.of(context).primaryColor,
    //         title: TextWidget(
    //           S.of(context).report,
    //           color: AppColor.white,
    //         ),
    //         leading: IconButton(
    //           icon: const Icon(
    //             Icons.arrow_back,
    //             color: AppColor.white,
    //           ),
    //           onPressed: () => Navigator.of(context).pop(),
    //         ),
    //       ),
    //       body: Padding(
    //         padding: const EdgeInsets.all(24.0),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: const [
                
    //           ],
    //         ),
    //       ),
    //     );
    //   });

    
  }
}
