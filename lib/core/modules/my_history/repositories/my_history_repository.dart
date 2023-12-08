import 'package:rws_app/core/modules/my_history/models/my_request_history_model.dart';

import '../../../../constants/api_path.dart';
import '../../../services/rest_api_service.dart';

class MyHistoryRepository extends RestApiService {
  Future<List<MyReqeustHistoryModel>> getMyHistoryList(int id) async {
    print(id);
    final res = await get(ApiPath.getAllMyRequestedHistory(id));
    print(res);
    return res
        .map<MyReqeustHistoryModel>((x) => MyReqeustHistoryModel.fromJson(x))
        .toList();
  }
}
