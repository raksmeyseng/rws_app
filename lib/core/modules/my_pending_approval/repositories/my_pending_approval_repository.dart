import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class MyPendingApprovalRepository extends RestApiService{

  Future<List<WaterSupplyModel>> getMyPendingApprovalList(int id) async{
    final res = await get(ApiPath.getPendingApprovalAdmin(id));
    return res.map<WaterSupplyModel>((x)=> WaterSupplyModel.fromJson(x)).toList();
  }

  Future<List<WaterSupplyModel>> getMyPendingApprovalListProvincialHead(int id) async{
    final res = await get(ApiPath.getPendingApprovalProvincialHead(id));
    return res.map<WaterSupplyModel>((x)=> WaterSupplyModel.fromJson(x)).toList();
  }

  Future<List<WaterSupplyModel>> getMyPendingApprovalListVerify1() async{
    final res=await get(ApiPath.getPendingApprovalDataVerifier1);
    return res.map<WaterSupplyModel>((x)=>WaterSupplyModel.fromJson(x)).toList();
  }

  Future<List<WaterSupplyModel>> getMyPendingApprovalListVerifier2() async{
    final res=await get(ApiPath.getPendingApprovalDataVerifier2);
    return res.map<WaterSupplyModel>((x)=>WaterSupplyModel.fromJson(x)).toList();
  }

  Future<List<WaterSupplyModel>> getMyPendingApprovalListDepartmentHead() async{
    final res=await get(ApiPath.getPendingApprovalDepartmentHead);
    return res.map<WaterSupplyModel>((x)=>WaterSupplyModel.fromJson(x)).toList();
  }

}