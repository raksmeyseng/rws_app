import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyEditRepository extends RestApiService {
  Future<WaterSupplyModel> getWaterSupplyDetail(int id) async {
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    return WaterSupplyModel.fromJson(res);
  }

  Future<WaterSupplyModel> addOrUpdateWaterSupply({
    required int waterSupplyTypeId,
    required int id,
  }) async {
    if (id == 0) {
      final res = await get(ApiPath.addWaterSupply(waterSupplyTypeId));
      return WaterSupplyModel.fromJson(res);
    } else {
      final res = await get(ApiPath.updateWaterSupply(id, waterSupplyTypeId));
      return WaterSupplyModel.fromJson(res);
    }
  }
}
