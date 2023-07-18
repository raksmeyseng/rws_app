import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_request/model/my_request_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class MyRequestRepository extends RestApiService{

  Future<List<MyRequestModel>> getMyRequestList(int id) async{
    final res = await get(ApiPath.getRequestProvincialHeadDepartment(id));
    return res.map<MyRequestModel>((x)=> MyRequestModel.fromJson(x)).toList();
  }

}