part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState._({
    this.status = BaseStatusEnum.initial,
    this.selectedMenu = MainMenuEnum.home,
    this.currentIndex = 0,
    this.index = 0,
  });

  final BaseStatusEnum status;
  final MainMenuEnum selectedMenu;
  final int currentIndex;
  final int index;

  const DashboardState.initial({required int index}) : this._(index: index);

  DashboardState copyWith({
    BaseStatusEnum? status,
    MainMenuEnum? selectedMenu,
    int? currentIndex,
  }) {
    return DashboardState._(
      status: status ?? this.status,
      selectedMenu: selectedMenu ?? this.selectedMenu,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [status, selectedMenu, currentIndex];
}
