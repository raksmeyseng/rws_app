import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class FilterWaterSupplyRepository extends RestApiService {
  Future<List<ProvinceModel>> getProvinces() async {
    final res = await get(ApiPath.getProvince());
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }

  Future<List<ProvinceModel>> getProvincesByDataEntry(int id) async {
    final res = await get(ApiPath.getProvinceByDataEntry(id));
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }

  Future<List<DistrictModel>> getDistrictByProvince(int id) async {
    final res = await get(ApiPath.getDistrictByProvinceId(id));
    return res.map<DistrictModel>((x) => DistrictModel.fromJson(x)).toList();
  }

  Future<List<CommuneModel>> getCommuneByDistrictId(int id) async {
    final res = await get(ApiPath.getCommuneByDistrictId(id));
    return res.map<CommuneModel>((x) => CommuneModel.fromJson(x)).toList();
  }

  Future<List<VillageModel>> getVillageByCommuneId(int id) async {
    final res = await get(ApiPath.getVillageByCommuneId(id));
    return res.map<VillageModel>((x) => VillageModel.fromJson(x)).toList();
  }
}
