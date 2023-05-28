import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/models/water_supply_workflow.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

import '../../../../translation/generated/l10n.dart';
import '../../../widgets/caption_widget.dart';
import '../../../widgets/flat_card.dart';

class ViewProcessFlow extends StatelessWidget {


  const ViewProcessFlow({Key? key, required this.workflows}):super(key:key);

  final List<WaterSupplyWorkFlowModel> workflows;

  //final List<MyApprovalHistoryModel> workflow;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            iconTheme: const IconThemeData(color: AppColor.white),
            title: const TextWidget(
              'មើលលំហូរដំណើរការ',
              //id.toString(),
              color: AppColor.white,
            ),
          ),
          body: ViewProcess(
                workflows: workflows,
              ),
        );
    
  }
}

class ViewProcess extends StatelessWidget {

  const ViewProcess({Key? key,required this.workflows}) : super(key: key);

  final List<WaterSupplyWorkFlowModel> workflows;

  @override
  Widget build(BuildContext context) {

     return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _WaterSupplyWorkFlowItem(workflows[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: workflows.length,
        );

    // List<ProcessFlow> namelist = [];
    // namelist.add(ProcessFlow(
    //     creationDate: '2023-03-16 09:23:22',
    //     status: 'Submitted',
    //     createdBy: 'Data Entry Pursat'));
    // namelist.add(ProcessFlow(
    //     creationDate: '2023-03-17 00:40:56',
    //     status: 'P Verified',
    //     createdBy: 'Department Head Pursat'));
    // namelist.add(ProcessFlow(
    //     creationDate: '2023-03-17 00:40:56',
    //     status: 'D1 Verified',
    //     createdBy: 'Data Verifier1'));
    // namelist.add(ProcessFlow(
    //     creationDate: '2023-03-17 00:40:56',
    //     status: 'D2 Verified',
    //     createdBy: 'Data Verifier2'));
    // namelist.add(ProcessFlow(
    //     creationDate: '2023-03-17 00:40:56',
    //     status: 'Published',
    //     createdBy: 'Department Head'));
    // return Column(
    //   children: [
    //     Table(
    //       border: TableBorder.all(
    //         color: Theme.of(context).disabledColor,
    //       ),
    //       // defaultColumnWidth: const FixedColumnWidth(150.0),
    //       children: const [
    //         TableRow(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(5),
    //               child: TextWidget(
    //                 'កាលបរិច្ឆេទបង្កើត',
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(5),
    //               child: TextWidget(
    //                 'ស្ថានភាព',
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(5),
    //               child: TextWidget(
    //                 'បង្កើតដោយ',
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     // view details
    //     Table(
    //       border: TableBorder.all(width: 1, color: Colors.black45),
    //       // defaultColumnWidth: const FixedColumnWidth(150.0),
    //       children: namelist.map((process) {
    //         return TableRow(children: [
    //           TableCell(
    //             child: Padding(
    //               padding: const EdgeInsets.all(5),
    //               child: Text(process.creationDate),
    //             ),
    //           ),
    //           TableCell(
    //             child: Padding(
    //               padding: const EdgeInsets.all(5),
    //               child: Text(process.status),
    //             ),
    //           ),
    //           TableCell(
    //             child: Padding(
    //               padding: const EdgeInsets.all(5),
    //               child: Text(process.createdBy),
    //             ),
    //           ),
    //         ]);
    //       }).toList(),
    //     )
    //   ],
    // );

  }
}

// dialog model view process flow
class ProcessFlow {
  ProcessFlow(
      {required this.creationDate,
      required this.status,
      required this.createdBy});

  String creationDate;
  String status;
  String createdBy;
}

class _WaterSupplyWorkFlowItem extends StatelessWidget {
  const _WaterSupplyWorkFlowItem(this.item);

  final WaterSupplyWorkFlowModel item;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.05),
      onTap: () {

      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            CaptionWidget('${S.of(context).news_date} :'),
            Flexible(
              child: TextWidget(
                item.createdAt,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).status} :'),
            TextWidget(item.status.statusNameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).user_name} :'),
            TextWidget('${item.user.firstName} ${item.user.lastName}'),
          ),


        ],
      ),
    );
  }
}


class _InfoItem extends StatelessWidget {
  const _InfoItem(this.label, this.value, {Key? key}) : super(key: key);

  final Widget label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [label, value],
    );
  }
}
