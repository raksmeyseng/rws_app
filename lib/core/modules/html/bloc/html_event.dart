part of 'html_bloc.dart';

abstract class HtmlEvent extends Equatable {
  const HtmlEvent();

  @override
  List<Object> get props => [];
}

class HtmlStarted extends HtmlEvent {
  const HtmlStarted(this.initialUrl);
  final String initialUrl;
  @override
  List<Object> get props => [initialUrl];
}

class ProgressChanged extends HtmlEvent {
  const ProgressChanged(this.progress);
  final int progress;
  @override
  List<Object> get props => [progress];
}
