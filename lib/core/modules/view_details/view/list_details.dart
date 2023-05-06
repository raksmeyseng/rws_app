import 'package:flutter/material.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_field.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';
import 'package:rws_app/core/modules/view_details/card/card_qr_detail.dart';
import 'package:rws_app/core/widgets/tabbar_widget.dart';

class ListDetails extends StatefulWidget {
  const ListDetails({Key? key, required int id}) : super(key: key);

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
    return const Scaffold(
      body: TabBarWidget(
        tabs: [
          Tab(text: 'មើលលម្អិត'),
          Tab(text: 'specific field'),
          Tab(text: 'QR Code & Maps'),
        ],
        title: 'មើលលំហូរដំណើរការ',
        children: [
          CardListDetails(),
          CardDataFields(),
          CardQRDetail()
        ],
      ),
    );
  }
}
