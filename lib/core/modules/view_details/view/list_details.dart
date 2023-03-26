import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_diagram.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';
import 'package:rws_app/core/modules/view_details/view_process_flow/view_process.dart';
import 'package:rws_app/core/style/fonts/app_style.dart';

class ListDetails extends StatefulWidget {
  const ListDetails({Key? key}) : super(key: key);

  @override
  State<ListDetails> createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF6c757d),
                  side: const BorderSide(color: Color(0xFF6c757d))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProcessFlow()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.rotate_left,
                    color: Colors.white,
                  ),
                  Text(
                    'មើលលំហូរដំណើរការ',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.grey.shade300,
                child: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  controller: _tabController,
                  labelPadding: const EdgeInsets.all(0.0),
                  tabs: [
                    _getTab(
                        0,
                        const Center(
                            child: Text(
                          'Details',
                          style: h4Style,
                        ))),
                    _getTab(
                        1,
                        const Center(
                            child: Text(
                          'Diagram',
                          style: h4Style,
                        ))),
                    _getTab(
                        2,
                        const Center(
                            child: Text(
                          'QR Code',
                          style: h4Style,
                        ))),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    CardListDetails(),
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

  _getTab(index, child) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          child: child,
          decoration: BoxDecoration(
              color: (_selectedTab == index ? Colors.white : Colors.lightGreen),
              borderRadius: _generateBorderRadius(index)),
        ),
      ),
    );
  }

  _generateBorderRadius(index) {
    if ((index + 1) == _selectedTab) {
      return const BorderRadius.only(bottomRight: Radius.circular(10.0));
    } else if ((index - 1) == _selectedTab) {
      return const BorderRadius.only(bottomLeft: Radius.circular(10.0));
    } else {
      return BorderRadius.zero;
    }
  }
}
