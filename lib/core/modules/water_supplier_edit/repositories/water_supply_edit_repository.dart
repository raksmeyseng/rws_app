import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_kiosk_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_pipe_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_workflow.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/response_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

import '../model/payload_smallpipe_model.dart';
import '../model/payload_pond_model.dart';
import '../model/payload_rain_model.dart';
import '../model/payload_air_model.dart';
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
// SmallPIPE--------------
Future<PayloadSmallPipeModel> addWaterSupplySmallPipe({required PayloadSmallPipeModel payload}) async{
  final res = await post(ApiPath.postSmallPipe, data:payload);
  return PayloadSmallPipeModel.fromJson(res);

}
Future<void> addWaterSupplySmallPipeOptionValue({required PayloadSmallPipeOptionValueModel payload}) async{
  await post(ApiPath.postSmallPipeOptionValue, data:payload);
}
//--------------

//------------- Start KIOSK 
Future<PayloadKioskModel> addWaterSupplyKiosk({required PayloadKioskModel payload}) async {
  final res = await post(ApiPath.postKiosk,data: payload);
  return PayloadKioskModel.fromJson(res);
}
Future<void> addWaterSupplyKioskOptionValue({required PayloadKioskOptionValueModel payload}) async{
  try{
    final res = await post(ApiPath.postKioskOptionValue, data:payload);
    print(res);
  }catch(_){

  }
  
  //return PayloadKioskOptionValueModel.fromJson(res);
}
//------------- End KIOSK
//-------------Start Pond
Future<PayloadPondModel> addWaterSupplyPond({required PayloadPondModel payload}) async{
  final res = await post(ApiPath.postCommunityPond, data:payload);
  return PayloadPondModel.fromJson(res);
}

Future<void> addWaterSupplyPondOptionValue({required PayloadPondOptionValueModel payload}) async{
  await post(ApiPath.postSmallPipeOptionValue, data:payload);
}

//-------------End Pond

//-------------Start Rain
Future<PayloadRainModel> addWaterSupplyRain({required PayloadRainModel payload}) async{
  final res = await post(ApiPath.postRainWaterHarvesting, data:payload);
  return PayloadRainModel.fromJson(res);
}

//-------------End Rain

//------------- Start Pipe
Future<PayloadPipeModel> addWaterSupplyPipe({required PayloadPipeModel payload}) async{
  final res = await post(ApiPath.postPipe, data: payload);
  return PayloadPipeModel.fromJson(res);
}
Future<void> addWaterSupplyPipeOptionValue({required PayloadPipeOptionValueModel payload}) async{
  await post(ApiPath.postPipeOptionValue, data:payload);
}
//------------- End Pipe

//-------------Start Air
Future<PayloadairModel> addWaterSupplyAir({required PayloadairModel payload}) async{
  final res = await post(ApiPath.postAirWater, data:payload);
  return PayloadairModel.fromJson(res);
}

Future<void> addWaterSupplyAirOptionValue({required PayloadairOptionValueModel payload}) async{
  await post(ApiPath.postAirWaterOptionValue, data:payload);
}

//-------------End Air

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
