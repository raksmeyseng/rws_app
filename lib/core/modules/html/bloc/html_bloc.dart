import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'html_event.dart';
part 'html_state.dart';

class HtmlBloc extends Bloc<HtmlEvent, HtmlState> {
  HtmlBloc() : super(const HtmlState.initial()) {
    on<HtmlEvent>(_onEvent);
  }

  Future<void> _onEvent(HtmlEvent event, Emitter<HtmlState> emit) async {
    if (event is HtmlStarted) {
      return _onStarted(event, emit);
    }
    if (event is ProgressChanged) {
      return _onProgressChanged(event, emit);
    }
  }

  void _onStarted(HtmlStarted event, Emitter<HtmlState> emit) {
    emit(state.copyWith(url: event.initialUrl));
  }

  void _onProgressChanged(ProgressChanged event, Emitter<HtmlState> emit) {
    emit(state.copyWith(progress: event.progress));
  }
}
