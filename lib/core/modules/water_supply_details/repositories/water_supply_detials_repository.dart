import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyDetialsRepository extends RestApiService {
  Future<List<WaterSupplyModel>> getWaterSupplyList(int id) async {
    final res = await get(ApiPath.getWaterSupplyList(id));
    return res
        .map<WaterSupplyModel>((x) => WaterSupplyModel.fromJson(x))
        .toList();
  }
}
