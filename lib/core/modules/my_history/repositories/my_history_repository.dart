
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

import '../../../../constants/api_path.dart';
import '../../../services/rest_api_service.dart';

class MyHistoryRepository extends RestApiService{

  Future<List<WaterSupplyModel>> getMyHistoryList(int id) async{
    print(id);
    final res = await get(ApiPath.getAllMyRequestedHistory(id));
    //print(res);
    return res.map<WaterSupplyModel>((x)=> WaterSupplyModel.fromJson(x)).toList();
  }

}