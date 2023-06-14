import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:excel/excel.dart';

import '../repositories/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc({
    required this.repository,
  }) : super(const ReportState.initial()) {
    on<ReportEvent>(_onReportEvent);
  }

  final ReportRepository repository;

  Future<void> _onReportEvent(ReportEvent event, Emitter<ReportState> emit) async{
    if(event is ReportEventStated){
      return _onReportStarted(event, emit);
    }
  }

  Future<void> _onReportStarted(ReportEventStated event, Emitter<ReportState> emit) async{
    emit(state.copyWith(status: BaseStatusEnum.inprogress));

    try{
      print('REport Start');
      // var excel = Excel.createExcel();
      // Sheet sheetObject = excel['Sheet1']; 
      // var cell = sheetObject.cell(CellIndex.indexByString('A1'));
      // cell.value = 8; // dynamic values support provided;

      // List<String> data = ['Mr','Joseph', 'Isiyemi'];
      // //Sheet sheetObject = selectedExcel['Sheet1'];
      // sheetObject.appendRow(data);

      // await Permission.storage.request();

      final report = repository.getExcelFile();
 
    

    }catch(e){
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }


}
