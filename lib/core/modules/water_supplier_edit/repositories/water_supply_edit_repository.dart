import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_workflow.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/response_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

import '../model/payload_water_quality_parameter_model.dart';
import '../model/payload_well.dart';
import '../model/qrcode_model.dart';

class WaterSupplyEditRepository extends RestApiService {

  Future<WaterSupplyModel> getWaterSupplyDetail(int id) async {
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    return WaterSupplyModel.fromJson(res);
  }

  Future<ResponseGenerateQRCode> getGenerateQRCodeResponse(int id) async{
    final res = await get(ApiPath.generateQRCode(id));
    return ResponseGenerateQRCode.fromJson(res);
  }

  Future<ResponseWaterSupplyModel> addOrUpdateWaterSupply({
    required int id,
    required PayloadWaterSupplyModel payload,
  }) async {
    if (id == 0) {
      //print(ApiPath.addWaterSupply);
        final res = await post(ApiPath.addWaterSupply, data: payload);
        ResponseWaterSupplyModel response=ResponseWaterSupplyModel.fromJson(res);     
        print(res);
        if(response.status==200){
          //Workflow SECTION
          final payloadWorkFlow=PayloadWaterSupplyWorkflow(
            waterSupplyId: response.waterSupplyId,
            status: payload.mainStatus,
            user: payload.createdBy
            );
            await post(ApiPath.postWorkFlow,data:payloadWorkFlow);
        }
        return response;
      
      
    } else {
      final res = await put(ApiPath.updateWaterSupply(id), data: payload);
      return ResponseWaterSupplyModel.fromJson(res);
    }
  }

  Future<PayloadWellModel> addWaterSupplyWell({required PayloadWellModel payload}) async{
    final res = await post(ApiPath.postWell,data:payload);
    return PayloadWellModel.fromJson(res);
  }

  Future<void> addWaterSupplyWellOptionValue({required PayloadWellOptionValueModel payload}) async{
    await post(ApiPath.postWellOption,data:payload);
  }

  Future<void> addWaterSupplyQRCode({required PayloadWaterSupplyQRCodeModel payload}) async{
    await post(ApiPath.postWaterSupplyQRcode, data:payload);
  }

  Future<void> addWaterQuanlityParameter({required PayloadWaterQualityParameterModel payload}) async{
    var res = await post(ApiPath.postWaterQualityParameter, data: payload);
  }

  Future<List<ProvinceModel>> getProvinces() async {
    final res = await get(ApiPath.getProvince());
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }
  Future<List<ProvinceModel>> getProvincesByDataEntry(int id) async{
    final res = await get(ApiPath.getProvinceByDataEntry(id));
    return res.map<ProvinceModel>((x) => ProvinceModel.fromJson(x)).toList();
  }
  Future<List<DistrictModel>> getDistrictByProvince(int id) async{
    final res = await get(ApiPath.getDistrictByProvinceId(id));
    return res.map<DistrictModel>((x)=>DistrictModel.fromJson(x)).toList();
  }
  Future<List<CommuneModel>> getCommuneByDistrictId(int id) async {
    final res = await get(ApiPath.getCommuneByDistrictId(id));
    return res.map<CommuneModel>((x)=>CommuneModel.fromJson(x)).toList();
  }
  Future<List<VillageModel>> getVillageByCommuneId(int id) async {
    final res = await get(ApiPath.getVillageByCommuneId(id));
    return res.map<VillageModel>((x)=>VillageModel.fromJson(x)).toList();
  }

}
