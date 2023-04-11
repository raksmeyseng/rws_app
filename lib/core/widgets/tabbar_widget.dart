import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/view_process_flow/view_process.dart';
import 'package:rws_app/core/widgets/my_button.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.title,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: 150,
              child: MyButton(
                color: Colors.black26,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewProcessFlow(),
                    ),
                  );
                },
                title: title,
              ),
            ),
          ),
        ],

        bottom:
        TabBar(
          unselectedLabelColor: Colors.lightBlue[100],
          isScrollable: true,
          indicator: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white]),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))),
          tabs: tabs,
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
          children: children,
      ),
    ),
  );
}