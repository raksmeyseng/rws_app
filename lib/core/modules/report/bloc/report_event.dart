part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];

}

class ReportEventStated extends ReportEvent{
  const ReportEventStated();
}
