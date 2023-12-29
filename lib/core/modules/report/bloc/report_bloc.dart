import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

//import 'package:excel/excel.dart';

import '../repositories/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc(this.repository) : super(const ReportState.initial()) {
    on<ReportEvent>(_onReportEvent);
  }

  final ReportRepository repository;

  Future<void> _onReportEvent(
    ReportEvent event, 
    Emitter<ReportState> emit) async{
    if(event is ReportEventStated){
      return _onReportStarted(event, emit);
    }
  }

  Future<void> _onReportStarted(
    ReportEventStated event, 
  Emitter<ReportState> emit) async{

    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    

    try{
      print('REport Start');
      

      // await Permission.storage.request();

      // final report = repository.getExcelFile();
 
      emit(state.copyWith(status: BaseStatusEnum.success));

    }catch(e){
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }


}
