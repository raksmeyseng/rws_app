import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class MyDraftRepository extends RestApiService {

  Future<List<WaterSupplyModel>> getMyDraftList(int id) async {

    final res = await get(ApiPath.getAllMyDraft(id));
    //final res = await get(ApiPath.getAllMyRequestedHistory(id));
    //print(res);
    return res.map<WaterSupplyModel>((x) => WaterSupplyModel.fromJson(x)).toList();

  }

}
