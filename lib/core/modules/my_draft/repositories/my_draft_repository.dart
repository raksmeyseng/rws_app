import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class MyDraftRepository extends RestApiService {
  Future<List<MyDraftModel>> getMyDraftList() async {
    final res = await get(
      ApiPath.getAllMyDraft,
    );
    return res.map<MyDraftModel>((x) => MyDraftModel.fromJson(x)).toList();
  }
}
