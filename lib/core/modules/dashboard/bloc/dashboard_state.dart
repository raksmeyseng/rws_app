part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState._({
    this.status = BaseStatusEnum.initial,
    this.selectedMenu = MainMenuEnum.account,
  });

  final BaseStatusEnum status;
  final MainMenuEnum selectedMenu;

  const DashboardState.initial() : this._();

  DashboardState copyWith({
    BaseStatusEnum? status,
    MainMenuEnum? selectedMenu,
  }) {
    return DashboardState._(
      status: status ?? this.status,
      selectedMenu: selectedMenu ?? this.selectedMenu,
    );
  }

  @override
  List<Object> get props => [status, selectedMenu];
}
