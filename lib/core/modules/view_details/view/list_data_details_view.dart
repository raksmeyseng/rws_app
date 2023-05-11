import 'package:flutter/material.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_field.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';
import 'package:rws_app/core/modules/view_details/card/card_qr_detail.dart';

class ListDataDetailsView extends StatelessWidget {
  const ListDataDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _TabBar(),
          Expanded(child: _TabBarView()),
        ],
      ),
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
    return TabBar(
      indicatorColor: Theme.of(context).primaryColor,
      tabs: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'មើលលម្អិត'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'Specific Field'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: 'QR Code & Maps'),
        )
      ],
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
    return const TabBarView(
      children: [
        CardListDetails(),
        CardDataFields(),
        CardQRDetail(),
      ],
    );
  }
}
