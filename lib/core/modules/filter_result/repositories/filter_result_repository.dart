import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_list_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class FilterResultRepository extends RestApiService {
  Future<List<WaterSupplyListByTypeModel>> getWaterSupplyListByType(
      int id) async {
    final res = await get(ApiPath.getWaterSupplyListByType(id));
    return res
        .map<WaterSupplyListByTypeModel>(
            (x) => WaterSupplyListByTypeModel.fromJson(x))
        .toList();
  }

  Future<List<WaterSupplyListByTypeModel>> getWaterSupplyFilterResultList(
      int id,
      String provinceId,
      String districtId,
      String communeId,
      String villageId) async {
    final res = await get(ApiPath.getWaterSupplyFilterResultList(
        id, provinceId, districtId, communeId, villageId));
    return res
        .map<WaterSupplyListByTypeModel>(
            (x) => WaterSupplyListByTypeModel.fromJson(x))
        .toList();
  }
}
