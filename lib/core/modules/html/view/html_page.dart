import 'package:rws_app/core/modules/html/bloc/html_bloc.dart';
import 'package:rws_app/core/modules/html/view/html_view.dart';
import 'package:rws_app/core/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HtmlPage extends StatelessWidget {
  const HtmlPage({
    Key? key,
    required this.title,
    required this.initialUrl,
  }) : super(key: key);

  final String title;
  final String initialUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HtmlBloc()..add(HtmlStarted(initialUrl)),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: title),
          backgroundColor: Theme.of(context).cardColor,
        ),
        body: const HtmlView(),
      ),
    );
  }
}
