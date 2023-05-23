import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply/model/water_supply_type_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyRepository extends RestApiService {
  Future<List<WaterSupplyTypeModel>> getWaterSupplyList() async {
    final res = await get(ApiPath.getWaterSupplyType);
    //print(res);
    return res
        .map<WaterSupplyTypeModel>((x) => WaterSupplyTypeModel.fromJson(x))
        .toList();
  }
}
