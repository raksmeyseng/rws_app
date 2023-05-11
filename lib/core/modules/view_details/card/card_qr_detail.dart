import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';

class CardQRDetail extends StatelessWidget {
  const CardQRDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        return Center(
          child: Image.network(
              'http://18.222.12.231/media/qr1681033557.780248.png'),
        );
      },
    );
  }
}
