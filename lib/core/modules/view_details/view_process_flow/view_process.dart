import 'package:flutter/material.dart';
import 'package:rws_app/core/style/fonts/app_style.dart';

class ViewProcessFlow extends StatelessWidget {
  const ViewProcessFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('មើលលំហូរដំណើរការ', style: h3Style,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: const Color(0xFF6c757d),side: const BorderSide(color: Color(0xFF6c757d))),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardPage()));
                Navigator.pop(context);
              },
              child: const Icon(Icons.close, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ViewProcess()
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
    namelist.add(ProcessFlow(creationDate: '2023-03-16 09:23:22', status: 'Submitted', createdBy: 'Data Entry Pursat'));
    namelist.add(ProcessFlow(creationDate: '2023-03-17 00:40:56', status: 'P Verified', createdBy: 'Department Head Pursat'));
    namelist.add(ProcessFlow(creationDate: '2023-03-17 00:40:56', status: 'D1 Verified', createdBy: 'Data Verifier1'));
    namelist.add(ProcessFlow(creationDate: '2023-03-17 00:40:56', status: 'D2 Verified', createdBy: 'Data Verifier2'));
    namelist.add(ProcessFlow(creationDate: '2023-03-17 00:40:56', status: 'Published', createdBy: 'Department Head'));
    return Column(
      children: [
        Table(
        border: TableBorder.all(width:1, color:Colors.black45,),
        // defaultColumnWidth: const FixedColumnWidth(150.0),
        children: const [
          TableRow(children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text('កាលបរិច្ឆេទបង្កើត', style: h3Style, textAlign: TextAlign.center,),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text('ស្ថានភាព', style: h3Style, textAlign: TextAlign.center,),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text('បង្កើតដោយ', style: h3Style, textAlign: TextAlign.center,),
          ),
        ]),
        ],
        ),
        // view details
        Table(
          border: TableBorder.all(width:1, color:Colors.black45),
          // defaultColumnWidth: const FixedColumnWidth(150.0),
          children: namelist.map((process){
            return TableRow(
                children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child:Text(process.creationDate)
                      )
                  ),
                  TableCell(child: Padding(
                      padding: EdgeInsets.all(5),
                      child:Text(process.status)
                  )
                  ),
                  TableCell(child: Padding(
                      padding: EdgeInsets.all(5),
                      child:Text(process.createdBy)
                  )
                  ),
                ]
            );}).toList(),
        )
      ],
    );
  }
}


// dialog model view process flow
class ProcessFlow {
  ProcessFlow({
    required this.creationDate,
    required this.status,
    required this.createdBy
  });

  String creationDate;
  String status;
  String createdBy;
}
