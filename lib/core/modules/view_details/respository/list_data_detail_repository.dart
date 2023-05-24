import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

import '../models/water_supply_delete_response.dart';

class ListDataDetailRepository extends RestApiService{
  Future<WaterSupplyModel> getWaterSupplyViewDetail(int id) async{
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    //print(res);
    return WaterSupplyModel.fromJson(res);
  }

  Future<WaterSupplyDeleteResponseModel> deleteWaterSupply(int id) async{
    final int userId = Application.authBloc.state.userToken?.user.id??0;
    final response = await put(ApiPath.deleteWaterSupply(id),data:{
      'id': id,
      'updated_by': userId,
      'is_active': false,
    });
    print(response);
    return WaterSupplyDeleteResponseModel.fromJson(response);
  }

  Future<void> submitDraftedWaterSupply(int id) async{
    final int userId = Application.authBloc.state.userToken?.user.id??0;

    await post(ApiPath.postWorkFlow,data:{
      'watersupply_id': id,
      'status_id':1,
      'user_id': userId,
      'remark': ''
    });

    await put(ApiPath.updateWaterSupplyMainStatus(id), 
    data:{
      'id': id,
      'main_status': 1
    });

  }

}