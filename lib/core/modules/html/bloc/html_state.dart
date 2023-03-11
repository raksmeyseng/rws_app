part of 'html_bloc.dart';

class HtmlState extends Equatable {
  const HtmlState._({
    this.url = '',
    this.progress = 0,
  });

  final String url;
  final int progress;

  const HtmlState.initial() : this._();

  HtmlState copyWith({
    String? url,
    int? progress,
  }) {
    return HtmlState._(
      url: url ?? this.url,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [url, progress];
}
