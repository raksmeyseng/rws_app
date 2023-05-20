

import 'package:rws_app/core/modules/my_approval_history/models/my_approval_history_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

import '../../../../constants/api_path.dart';

class MyApprovalHistoryRepository extends RestApiService{
  Future<List<MyApprovalHistoryModel>> getMyApprovalHistoryList(int id) async{
    final res = await get(ApiPath.getAllMyApprovalHistory(id));
    return res.map<MyApprovalHistoryModel>((x)=>MyApprovalHistoryModel.fromJson(x)).toList();
  }
}