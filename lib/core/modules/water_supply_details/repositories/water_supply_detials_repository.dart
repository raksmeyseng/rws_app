import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/map/model/water_supply_map_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyDetialsRepository extends RestApiService {
  Future<List<WaterSupplyModel>> getWaterSupplyListv2(int id) async {
    final res = await get(ApiPath.getWaterSupplyListv2(id));
    return res
        .map<WaterSupplyModel>((x) => WaterSupplyModel.fromJson(x))
        .toList();
  }
  Future<List<WaterSupplyModel>> getWaterSupplyListAll() async {
    final res = await get(ApiPath.getWaterSupplyListAll);
    return res
        .map<WaterSupplyModel>((x) => WaterSupplyModel.fromJson(x))
        .toList();
  }
  Future<List<WaterSupplyMapModel>> getWaterSupplyMapList() async{
    final res = await get(ApiPath.getWaterSupplyListAll);
    return res
        .map<WaterSupplyMapModel>((x) => WaterSupplyMapModel.fromJson(x))
        .toList();
  }
}
