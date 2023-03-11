part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardStarted extends DashboardEvent {
  const DashboardStarted();
}

class SelectedMenuChanged extends DashboardEvent {
  const SelectedMenuChanged(this.selectedMenu);
  final MainMenuEnum selectedMenu;
  @override
  List<Object> get props => [selectedMenu];
}
