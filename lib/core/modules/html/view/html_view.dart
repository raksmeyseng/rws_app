import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/modules/html/bloc/html_bloc.dart';
import 'package:rws_app/core/services/rest_api_service.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/utils/helpers/network_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const _WebView();
    }
    return const _MobileView();
  }
}

class _WebView extends StatelessWidget {
  const _WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HtmlBloc, HtmlState>(
      buildWhen: (previous, current) => previous.url != current.url,
      builder: (context, state) {
        return FutureBuilder<dynamic>(
          future: RestApiService().get(state.url),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || snapshot.data == false) {
              return const LoadDataFailed();
            }
            final style = Theme.of(context).textTheme.bodyLarge!;
            return Html(
              style: {
                'body': Style(
                  lineHeight: LineHeight.number(1.5),
                  color: style.color,
                  fontFamily: style.fontFamily,
                  fontSize:
                      style.fontSize != null ? FontSize(style.fontSize!) : null,
                ),
              },
              data: snapshot.data,
            );
          },
        );
      },
    );
  }
}

class _MobileView extends StatefulWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  late WebViewController? webViewController;
  late Future<bool> _hasInternet;

  @override
  void initState() {
    super.initState();
    _hasInternet = NetworkHelper.isNetworkConnected();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HtmlBloc, HtmlState>(
      buildWhen: (previous, current) => previous.url != current.url,
      builder: (context, state) {
        return FutureBuilder(
          future: _hasInternet,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || snapshot.data == false) {
              return const LoadDataFailed();
            }
            return const Column(
              children: [
                _ProgressIndicator()
                // Expanded(
                //   child: WebView(
                //     key: Key(state.url),
                //     initialUrl: state.url,
                //     backgroundColor: Theme.of(context).cardColor,
                //     javascriptMode: JavascriptMode.unrestricted,
                //     onWebViewCreated: (controller) {
                //       webViewController = controller;
                //     },
                //     navigationDelegate: (navigation) {
                //       if (navigation.url != state.url) {
                //         // launchUrlString(navigation.url);
                //         copyTextToClipboard(context, navigation.url);
                //         return NavigationDecision.prevent;
                //       }
                //       return NavigationDecision.navigate;
                //     },
                //     onPageFinished: (url) async {
                //       if (!mounted) return;

                //       if (isAppDarkMode()) {
                //         // ignore: prefer_single_quotes
                //         await webViewController?.runJavascript("""
                //               var body = document.getElementsByTagName("body")[0];
                //               body.setAttribute("style", "padding:16px;color:#ffffff;");
                //             """);
                //       } else {
                //         // ignore: prefer_single_quotes
                //         await webViewController?.runJavascript("""
                //               var body = document.getElementsByTagName("body")[0];
                //               body.setAttribute("style", "padding:16px");
                //             """);
                //       }
                //     },
                //     onProgress: (progress) {
                //       if (mounted) {
                //         context.read<HtmlBloc>().add(ProgressChanged(progress));
                //       }
                //     },
                //   ),
                // ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HtmlBloc, HtmlState>(
      buildWhen: (previous, current) => previous.progress != current.progress,
      builder: (context, state) {
        return Container(
          color: Theme.of(context).cardColor,
          child: SizedBox(
            height: 4.0,
            child: MyAnimatedSwitcher(
              child: state.progress < 100
                  ? const LinearProgressIndicator()
                  : const SizedBox(height: 0),
            ),
          ),
        );
      },
    );
  }
}
