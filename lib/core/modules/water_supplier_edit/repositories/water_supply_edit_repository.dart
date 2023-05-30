import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class WaterSupplyEditRepository extends RestApiService {
  Future<WaterSupplyModel> getWaterSupplyDetail(int id) async {
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    return WaterSupplyModel.fromJson(res);
  }

  Future<void> addOrUpdateWaterSupply({
    required int id,
    required PayloadWaterSupplyModel payload,
  }) async {
    if (id == 0) {
      try{
        print(ApiPath.addWaterSupply);
        final res = await post(ApiPath.addWaterSupply, data: payload);
        print(res);
        //return WaterSupplyModel.fromJson(res);
      }catch(_){

      }
      
      
    } else {
      final res = await post(ApiPath.updateWaterSupply(id), data: payload);
      //return WaterSupplyModel.fromJson(res);
    }
  }

  Future<List<ProvinceModel>> getProvinces() async {
    final res = await get(ApiPath.getProvince());
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }
  Future<List<ProvinceModel>> getProvincesByDataEntry(int id) async{
    final res = await get(ApiPath.getProvinceByDataEntry(id));
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }
}
