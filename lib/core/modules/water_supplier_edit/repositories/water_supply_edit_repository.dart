import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyEditRepository extends RestApiService {
  Future<WaterSupplyModel> getWaterSupplyDetail(int id) async {
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    return WaterSupplyModel.fromJson(res);
  }
}
