import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_diagram.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';

class ListDetails extends StatefulWidget {
  const ListDetails({Key? key}) : super(key: key);

  @override
  State<ListDetails> createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.all(5),
        //     child: SizedBox(
        //       width: 150,
        //       child: MyButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const ViewProcessFlow(),
        //             ),
        //           );
        //         },
        //         title: 'មើលលំហូរដំណើរការ',
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                controller: _tabController,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Tab(text: 'មើលលម្អិត'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Tab(text: 'Diagram'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Tab(text: 'QR Code'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const CardListDetails(),
                    const CardDataDiagram(),
                    Center(
                      child: Image.network(
                          'http://ec2-52-14-59-145.us-east-2.compute.amazonaws.com/media/qr1678958602.6619184.png'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // _getTab(index, child) {
  //   return Tab(
  //     child: SizedBox.expand(
  //       child: Container(
  //         child: child,
  //         decoration: BoxDecoration(
  //             color: (_selectedTab == index
  //                 ? Colors.white
  //                 : Theme.of(context).primaryColor),
  //             borderRadius: _generateBorderRadius(index)),
  //       ),
  //     ),
  //   );
  // }

  // _generateBorderRadius(index) {
  //   if ((index + 1) == _selectedTab) {
  //     return const BorderRadius.only(bottomRight: Radius.circular(10.0));
  //   } else if ((index - 1) == _selectedTab) {
  //     return const BorderRadius.only(bottomLeft: Radius.circular(10.0));
  //   } else {
  //     return BorderRadius.zero;
  //   }
  // }
}
