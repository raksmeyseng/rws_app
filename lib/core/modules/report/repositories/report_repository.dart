import 'package:rws_app/core/services/rest_api_service.dart';

import '../../../../constants/api_path.dart';

class ReportRepository extends RestApiService{
  Future<void> getExcelFile() async{
    final res = await get(ApiPath.getReportExcel);
    print(res);
  }
}