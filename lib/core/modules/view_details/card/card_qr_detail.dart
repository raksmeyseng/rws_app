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
        String url = 'http://18.222.12.231/media/';
        String qrCodeName= state.waterSupply!.qrcode!.first.qrCodeImageName;
        url = url+qrCodeName;
        return Center(
          child: Image.network(url),
        );
      },
    );
  }
}
