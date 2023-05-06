import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/view_process_flow/view_process.dart';
import 'package:rws_app/core/widgets/floating_event.dart';
import 'package:rws_app/core/widgets/my_button.dart';

class TabBarWidget extends StatefulWidget {
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
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: AppColor.white),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 150,
                child: MyButton(
                  color: Colors.black12,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewProcessFlow(),
                      ),
                    );
                  },
                  title: widget.title,
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
            tabs: widget.tabs,
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
            children: widget.children,
        ),
        floatingActionButton: count == 0 ? const FloatingEvent() : null,
        bottomNavigationBar: count != 0 ? null : Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: (){
                    print('reject!');
                  },
                  child: const Text('Reject', style: TextStyle(color: Colors.white),),
                )
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: (){
                    print('approve');
                  },
                  child: const Text('Approve', style: TextStyle(color: Colors.white),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
