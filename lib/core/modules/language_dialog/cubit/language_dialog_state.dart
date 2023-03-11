part of 'language_dialog_cubit.dart';

class LanguageDialogState extends Equatable {
  const LanguageDialogState._({
    this.saveStatus = BaseStatusEnum.initial,
    this.savingLanguage,
  });

  final BaseStatusEnum saveStatus;
  final LanguageEnum? savingLanguage;

  const LanguageDialogState.initial() : this._();

  LanguageDialogState copyWith({
    BaseStatusEnum? saveStatus,
    LanguageEnum? savingLanguage,
  }) {
    return LanguageDialogState._(
      saveStatus: saveStatus ?? this.saveStatus,
      savingLanguage: savingLanguage ?? this.savingLanguage,
    );
  }

  @override
  List<Object?> get props => [saveStatus, savingLanguage];
}
