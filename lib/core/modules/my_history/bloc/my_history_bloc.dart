import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

part 'my_history_event.dart';
part 'my_history_state.dart';

class MyHistoryBloc extends Bloc<MyHistoryEvent, MyHistoryState> {
  MyHistoryBloc() : super(const MyHistoryState.initial()) {
    on<MyHistoryEvent>((event, emit) {});
  }
}
