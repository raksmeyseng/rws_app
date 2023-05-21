import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class ViewProcessFlow extends StatelessWidget {
  const ViewProcessFlow({Key? key}) : super(key: key);

  //final List<MyApprovalHistoryModel> workflow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        title: const TextWidget(
          'មើលលំហូរដំណើរការ',
          color: AppColor.white,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: ViewProcess(),
        ),
      ),
    );
  }
}

class ViewProcess extends StatelessWidget {
  const ViewProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProcessFlow> namelist = [];
    namelist.add(ProcessFlow(
        creationDate: '2023-03-16 09:23:22',
        status: 'Submitted',
        createdBy: 'Data Entry Pursat'));
    namelist.add(ProcessFlow(
        creationDate: '2023-03-17 00:40:56',
        status: 'P Verified',
        createdBy: 'Department Head Pursat'));
    namelist.add(ProcessFlow(
        creationDate: '2023-03-17 00:40:56',
        status: 'D1 Verified',
        createdBy: 'Data Verifier1'));
    namelist.add(ProcessFlow(
        creationDate: '2023-03-17 00:40:56',
        status: 'D2 Verified',
        createdBy: 'Data Verifier2'));
    namelist.add(ProcessFlow(
        creationDate: '2023-03-17 00:40:56',
        status: 'Published',
        createdBy: 'Department Head'));
    return Column(
      children: [
        Table(
          border: TableBorder.all(
            color: Theme.of(context).disabledColor,
          ),
          // defaultColumnWidth: const FixedColumnWidth(150.0),
          children: const [
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextWidget(
                    'កាលបរិច្ឆេទបង្កើត',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextWidget(
                    'ស្ថានភាព',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextWidget(
                    'បង្កើតដោយ',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
        // view details
        Table(
          border: TableBorder.all(width: 1, color: Colors.black45),
          // defaultColumnWidth: const FixedColumnWidth(150.0),
          children: namelist.map((process) {
            return TableRow(children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(process.creationDate),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(process.status),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(process.createdBy),
                ),
              ),
            ]);
          }).toList(),
        )
      ],
    );
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
