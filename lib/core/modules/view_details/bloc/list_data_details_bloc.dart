import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/respository/list_data_detail_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'dart:isolate';
import 'dart:ui'; 

part 'list_data_detials_event.dart';
part 'list_data_detials_state.dart';

class ListDataDetailsBloc
    extends Bloc<ListDataDetailsEvent, ListDataDetailsState> {
  ListDataDetailsBloc({
    required this.repository,
    required int waterSupplyId,
  }) : super(ListDataDetailsState.initial(waterSupplyId: waterSupplyId)) {
    on<ListDataDetailsEvent>(_onListDataDetailsEvent);
  }

  final ListDataDetailRepository repository;
  final ReceivePort _port = ReceivePort();

  Future<void> _onListDataDetailsEvent(
    ListDataDetailsEvent event,
    Emitter<ListDataDetailsState> emit,
  ) async {
    if (event is ListDataStarted) {
      return _onListDataDetailsStarted(event, emit);
    }
    if (event is DeleteSubmited) {
      return _onDeleteSubmited(event, emit);
    }
    if (event is SubmitDrafted) {
      return _onSubmitDrafted(event, emit);
    }
    if (event is ProvincialHeadDepartmentApprove) {
      return _onPDHApproved(event, emit);
    }
    if (event is ProvincialHeadDepartmentReject) {
      return _onPDHRejected(event, emit);
    }
    if (event is ProvincialHeadDepartmentRequestEdit) {
      return _onPDHRequestEdit(event, emit);
    }
  }

  Future<void> _onListDataDetailsStarted(
    ListDataStarted event,
    Emitter<ListDataDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {

      final waterSupply =
          await repository.getWaterSupplyViewDetail(state.waterSupplyId);

          // IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
          // _port.listen((dynamic data) {
          //   String id = data[0];
          //   DownloadTaskStatus status = data[1];
          //   int progress = data[2];
            
          // });

    //FlutterDownloader.registerCallback(downloadCallback);

      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
        mainStatus: waterSupply.status.id,
      ));

    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  Future<void> _onDeleteSubmited(
      DeleteSubmited event, Emitter<ListDataDetailsState> emit) async {
    try {
      //await repository.deleteWaterSupply(state.waterSupplyId);
      await repository.downloadExcel();

      emit(state.copyWith(status: BaseStatusEnum.success));
    } catch (_) {
      emit(state.copyWith(deleteStatus: BaseStatusEnum.failure));
    }
  }

  Future<void> _onSubmitDrafted(
      SubmitDrafted event, Emitter<ListDataDetailsState> emit) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      await repository.submitDraftedWaterSupply(state.waterSupplyId, 1);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
      ));
      await Future.delayed(const Duration(milliseconds: 300));
      Application.router.goNamed(AppRoute.home);
    } catch (_) {
      emit(state.copyWith(
        status: BaseStatusEnum.failure,
      ));
    }
  }
  //provincial department head request edit
  Future<void> _onPDHRequestEdit(ProvincialHeadDepartmentRequestEdit event,
      Emitter<ListDataDetailsState> emit) async {
    print ('Main Status : ${state.mainStatus}');
    int status = 0;
    if (state.mainStatus == 9) {
      //Provincial Department Head Request Edit
      status = 12;
    }

    if (status > 0) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        await repository.provincialDepartmentHeadRequestEdit(state.waterSupplyId, status);
        emit(state.copyWith(
          status: BaseStatusEnum.success,
        ));
        await Future.delayed(const Duration(milliseconds: 300));
        Application.router.goNamed(AppRoute.home);
      } catch (_) {
        emit(state.copyWith(
          status: BaseStatusEnum.failure,
        ));
      }
    }
  }

  Future<void> _onPDHApproved(ProvincialHeadDepartmentApprove event,
      Emitter<ListDataDetailsState> emit) async {
    // print ('Main Status : ${state.mainStatus}');
    int status = 0;
    if (state.mainStatus == 1) {
      status = 2; // Provincial Head Approved
    } else if (state.mainStatus == 2) {
      //Data verifier1 Approved
      status = 5;
    } else if (state.mainStatus == 5) {
      //Data Verifier2 Approved
      status = 7;
    } else if (state.mainStatus == 7) {
      //Department Head Approved
      status = 9;
    }

    if (status > 0) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        await repository.submitDraftedWaterSupply(state.waterSupplyId, status);
        emit(state.copyWith(
          status: BaseStatusEnum.success,
        ));
        await Future.delayed(const Duration(milliseconds: 300));
        Application.router.goNamed(AppRoute.home);
      } catch (_) {
        emit(state.copyWith(
          status: BaseStatusEnum.failure,
        ));
      }
    }
  }

  Future<void> _onPDHRejected(ProvincialHeadDepartmentReject event,
      Emitter<ListDataDetailsState> emit) async {
    int status = 0;
    if (state.mainStatus == 1) {
      //Provincial Department Head Rejected
      status = 4;
    } else if (state.mainStatus == 2) {
      //Data verifier1 Approved
      status = 6;
    } else if (state.mainStatus == 5) {
      //Data Verifier2 Approved
      status = 8;
    } else if (state.mainStatus == 7) {
      //Department Head Approved
      status = 10;
    } else if (state.mainStatus == 12) {
      //Provincial Department Head Request Edit
      status = 12;
    }

    if (status > 0) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        await repository.submitDraftedWaterSupply(state.waterSupplyId, status);
        emit(state.copyWith(
          status: BaseStatusEnum.success,
        ));
        await Future.delayed(const Duration(milliseconds: 300));
        Application.router.goNamed(AppRoute.home);
      } catch (_) {
        emit(state.copyWith(
          status: BaseStatusEnum.failure,
        ));
      }
    }
  }

  void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }
}
