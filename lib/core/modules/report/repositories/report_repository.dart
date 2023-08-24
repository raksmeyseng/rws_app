import 'dart:convert';
import 'dart:typed_data';
//import 'dart:html' as html;
import 'package:rws_app/core/services/rest_api_service.dart';

import '../../../../constants/api_path.dart';

class ReportRepository extends RestApiService{
  Future<void> getExcelFile() async{
    final res = await post(ApiPath.getReportExcel);
    print(res);
  }

//   Future<void> excel(
//     final dynamic response,
//   ) async {
//     final Uint8List bytes = response.data as Uint8List;
//     final header = response.headers.value('content-disposition');
//     //final fileName = DioHelper.extractFilename(header);
//     const fileName='sample.xlsx';
//     // Create a download link in the web app
//     html.AnchorElement(
//       href: 'data:application/octet-stream;base64,${base64.encode(bytes)}',
//     )
//       ..setAttribute('download', fileName)
//       ..click();
//   }
}