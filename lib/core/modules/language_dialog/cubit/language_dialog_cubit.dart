import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';

part 'language_dialog_state.dart';

class LanguageDialogCubit extends Cubit<LanguageDialogState> {
  LanguageDialogCubit(this.userRepo)
      : super(const LanguageDialogState.initial());

  final UserRepository userRepo;

  Future<void> saveLanguage(LanguageEnum language) async {
    try {
      emit(state.copyWith(
        saveStatus: BaseStatusEnum.inprogress,
        savingLanguage: language,
      ));
      final user = Application.authBloc.state.user;
      if (user == null) {
        return Future.value();
      }
      // final setting = user.settings!
      //     .copyWith(languageCode: language.getLocale().languageCode);
      // final updatedUser = await userRepo.updateSettings(user.id, setting);
      // Application.authBloc.add(UserUpdated(updatedUser));
      emit(state.copyWith(saveStatus: BaseStatusEnum.success));
    } catch (e) {
      emit(state.copyWith(saveStatus: BaseStatusEnum.failure));
    }
  }
}
