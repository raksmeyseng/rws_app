import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../models/water_supply_delete_response.dart';

class ListDataDetailRepository extends RestApiService{
  
  Future<WaterSupplyModel> getWaterSupplyViewDetail(int id) async{
    final res = await get(ApiPath.getWaterSupplyDetail(id));
    // //print(res);
    // var localDirectory = await getApplicationDocumentsDirectory(); 
    // await FlutterDownloader.enqueue(
    //     url: 'http://18.222.12.231/en/api/exportcsvwatersupply/',
    //     savedDir: localDirectory.path,
    //     showNotification: true,
    //     fileName: 'MRD TEST',
    //     openFileFromNotification: true,
    //     saveInPublicStorage: false
    //   );
    //_downloadExcel();
    return WaterSupplyModel.fromJson(res);
  }

  Future<void> downloadExcel() async{
  final status = await Permission.storage.request();

      if(status.isGranted) {
        try{
          final externalDir = await getExternalStorageDirectory();

          final res = await get('http://18.222.12.231/en/api/exportcsvwatersupply/');
          print(res);
          // final id = await FlutterDownloader.enqueue(
          //     url: 'http://18.222.12.231/en/api/exportcsvwatersupply/',
          //     //url:'https://www.kozco.com/tech/LRMonoPhase4.mp3',
          //     savedDir: externalDir!.path,
          //   showNotification: true,
          //   saveInPublicStorage: true,
          //   openFileFromNotification: true,
          // );
        }catch(_){

        }
        
      } else {
        print('Permission Denied');
      }
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

  Future<void> submitDraftedWaterSupply(int id,int status) async{
    final int userId = Application.authBloc.state.userToken?.user.id??0;

    await post(ApiPath.postWorkFlow,data:{
      'watersupply_id': id,
      'status_id':status,
      'user_id': userId,
      'remark': ''
    });

    await put(ApiPath.updateWaterSupplyMainStatus(id), 
    data:{
      'id': id,
      'main_status': status
    });

  }

  void _downloadExcel() async{
    final status = await Permission.storage.request();

    if(status.isGranted) {
      final externalDir = await getExternalStorageDirectory();

      final id = await FlutterDownloader.enqueue(
          url: 'http://18.222.12.231/en/api/exportcsvwatersupply/',
          savedDir: externalDir!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      print('Permission Denied');
    }
  }
}