import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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

          // final res = await get('http://18.222.12.231/en/api/exportcsvwatersupply/');
          // print(res);
          final id = await FlutterDownloader.enqueue(
              url: 'http://18.222.12.231/en/api/exportcsvwatersupply/',
              //url:'https://www.kozco.com/tech/LRMonoPhase4.mp3',
              savedDir: externalDir!.path,
            showNotification: true,
            saveInPublicStorage: true,
            openFileFromNotification: true,
          );
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

  Future<void> provincialDepartmentHeadRequestEdit(int id,int status) async{
    final int userId = Application.authBloc.state.userToken?.user.id??0;
    print('status : $status');
    await post(ApiPath.postWorkFlow,data:{
      'watersupply_id': id,
      'status_id':status,
      'user_id': userId,
      'remark': 'remark'
    });

    await put(ApiPath.updateWaterSupplyMainStatus(id),
    data:{
      'id': id,
      'main_status': status
    });

  }

  
  Future<void> getExcelFile() async{
    //final res = await post(ApiPath.getReportExcel);
    final res = await post(ApiPath.getReportExcel);
    final Uint8List bytes = Uint8List.fromList(utf8.encode(res));
    //var file = await writeFile(bytes, 'name.xlsx');
    final file =await writeCounter(res,'myname');
    // print(res);
    // excel(res);
    //return res;
  }

    Future<void> excel(
    final dynamic response,
  ) async {
    final Uint8List bytes = Uint8List.fromList(utf8.encode(response));
      //final header = response.headers.value('content-disposition');
      //final fileName = DioHelper.extractFilename(header);
      const fileName='sample';
      // Create a download link in the web app
      final dir = await getExternalStorageDirectory(); 
      final myImagePath = dir!.path + "/myimg.xlsx"; 
      File imageFile = File(myImagePath); 
      if(! await imageFile.exists())
      {   
        imageFile.create(recursive: true); 
        } 
        imageFile.writeAsBytes(bytes);

      // html.AnchorElement(
      //   href: 'data:application/octet-stream;base64,${base64.encode(bytes)}',
      // )
      //   ..setAttribute('download', fileName)
      //   ..click();
  }

  Future<File> writeFile(Uint8List data, String name) async {
    // storage permission ask
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   await Permission.storage.request();
    // }
    // the downloads folder path
    final path = await _localPath;

    //String tempPath = tempDi;
    var filePath = '$path/$name';
    // 

    // the data
    var bytes = ByteData.view(data.buffer);
    final buffer = bytes.buffer;
    // save the data in the path
    return File(filePath).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory _directory = Directory("");
    if (Platform.isAndroid) {
       // Redirects it to download folder in android
      _directory = Directory("/storage/emulated/0/Download");
    } else {
      _directory = await getApplicationDocumentsDirectory();
    }
  
    final exPath = _directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }
  
  static Future<String> get _localPath async {

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }

    final directory = await getApplicationDocumentsDirectory();
    return directory.path;

    // To get the external path from device of download folder
    //final String directory = await getExternalDocumentPath();
    //return directory;
  }
  
static Future<File> writeCounter(String bytes,String name) async {
  final path = await _localPath;
    // Create a file for the path of
      // device and file name with extension
      final file = File('${(await getTemporaryDirectory()).path}/$name');
    //File file= File('$path/$name');
    print("Save file");
      
      // Write the data in the file you have created
    return file.writeAsString(bytes);
  }

}