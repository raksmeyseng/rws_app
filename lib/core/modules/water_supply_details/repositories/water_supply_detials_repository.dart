import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/map/model/water_supply_map_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

import '../model/water_supply_list_model.dart';

class WaterSupplyDetialsRepository extends RestApiService {
  Future<List<WaterSupplyListModel>> getWaterSupplyListv2(int id) async {
    final res = await get(ApiPath.getWaterSupplyList(id));
    return res
        .map<WaterSupplyListModel>((x) => WaterSupplyListModel.fromJson(x))
        .toList();
  }
  Future<List<WaterSupplyModel>> getWaterSupplyListAll() async {
    final res = await get(ApiPath.getWaterSupplyListAll);
    return res
        .map<WaterSupplyModel>((x) => WaterSupplyModel.fromJson(x))
        .toList();
  }
  Future<List<WaterSupplyMapModelV2>> getWaterSupplyMapList() async{
    //final res = await get(ApiPath.getWaterSupplyMap);
    final res = await get(ApiPath.getWaterSupplyMap_v2);
    print(res);
    return res
        .map<WaterSupplyMapModelV2>((x) => WaterSupplyMapModelV2.fromJson(x))
        .toList();
  }
}
