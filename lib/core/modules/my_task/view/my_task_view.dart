import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_task/bloc/my_task_bloc.dart';

class MyTaskView extends StatelessWidget {
  const MyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTaskBloc, MyTaskState>(
      buildWhen: (previous, current) => previous.tabs != current.tabs,
      builder: (context, state) {
        return DefaultTabController(
          length: state.tabs.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _TabBar(),
              Expanded(child: _TabBarView()),
            ],
          ),
        );
      },
    );
  }
}

// ======================
// TabBar Widget
// ======================
class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTaskBloc, MyTaskState>(
      buildWhen: (previous, current) => previous.tabs != current.tabs,
      builder: (context, state) {
        return TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          tabs: state.tabs
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Tab(text: e.name),
                  ))
              .toList(),
        );
      },
    );
  }
}

// ======================
// TabBarView Widget
// ======================
class _TabBarView extends StatelessWidget {
  const _TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTaskBloc, MyTaskState>(
      buildWhen: (previous, current) => previous.tabs != current.tabs,
      builder: (context, state) {
        return TabBarView(
          children: state.tabs.map((e) => e.widget).toList(),
        );
      },
    );
  }
}
