import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/view_details/bloc/view_details_bloc.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_diagram.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';
import 'package:rws_app/core/modules/view_details/card/card_qr_detail.dart';
import 'package:rws_app/core/widgets/tabbar_widget.dart';

class ListDetails extends StatefulWidget {
  //const ListDetails({int id}) : super(key: key);
  const ListDetails({
    super.key,
    required this.id,

  });

  final int id;


  @override
  State<ListDetails> createState() => _ListDetailsState();

/*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return BlocBuilder<WaterSupplyViewDetailBloc,WaterSupplyViewDetailState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const _ListDetailsState();
      },
    );
  }

 */
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
              Tab(icon: Icon(Icons.info), text: 'មើលលម្អិត'),
              Tab(icon: Icon(Icons.account_tree), text: 'Diagram'),
              Tab(icon: Icon(Icons.qr_code), text: 'QR Code'),
            ],
            title: 'មើលលំហូរដំណើរការ',
            children: [
              CardListDetails(),
              CardDataDiagram(),
              CardQRDetail()
            ],
          ),
        );

    //return const
  }
}
