import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_pending_approval/model/my_pending_approval_model.dart';

import 'package:rws_app/core/services/rest_api_service.dart';

class MyPendingApprovalRepository extends RestApiService {
  Future<List<PendingApprovalModel>> getMyPendingApprovalList(int id) async {
    final res = await get(ApiPath.getPendingApprovalAdmin(id));
    return res
        .map<PendingApprovalModel>((x) => PendingApprovalModel.fromJson(x))
        .toList();
  }

  Future<List<PendingApprovalModel>> getMyPendingApprovalListProvincialHead(
      int id) async {
    final res = await get(ApiPath.getPendingApprovalProvincialHead(id));
    return res
        .map<PendingApprovalModel>((x) => PendingApprovalModel.fromJson(x))
        .toList();
  }

  Future<List<PendingApprovalModel>> getMyPendingApprovalListVerify1() async {
    final res = await get(ApiPath.getPendingApprovalDataVerifier1);
    return res
        .map<PendingApprovalModel>((x) => PendingApprovalModel.fromJson(x))
        .toList();
  }

  Future<List<PendingApprovalModel>> getMyPendingApprovalListVerifier2() async {
    final res = await get(ApiPath.getPendingApprovalDataVerifier2);
    return res
        .map<PendingApprovalModel>((x) => PendingApprovalModel.fromJson(x))
        .toList();
  }

  Future<List<PendingApprovalModel>>
      getMyPendingApprovalListDepartmentHead() async {
    final res = await get(ApiPath.getPendingApprovalDepartmentHead);
    return res
        .map<PendingApprovalModel>((x) => PendingApprovalModel.fromJson(x))
        .toList();
  }
}
