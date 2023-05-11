import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';
import 'package:rws_app/core/modules/view_details/respository/list_data_detail_repository.dart';
import 'package:rws_app/core/modules/view_details/view/list_data_details_view.dart';
import 'package:rws_app/core/modules/view_details/view_process_flow/view_process.dart';
import 'package:rws_app/core/widgets/my_button.dart';

import '../../../widgets/text_widget.dart';

class ListDataDetailsPage extends StatelessWidget {
  const ListDataDetailsPage({
    Key? key,
    required this.waterSupplyId,
    this.title,
  }) : super(key: key);

  final int waterSupplyId;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListDataDetailsBloc(
        repository: ListDataDetailRepository(),
        waterSupplyId: waterSupplyId,
      )..add(const ListDataStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(title, color: AppColor.white),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyButton(
                title: 'លំហូរដំណើរការ',
                maxWidth: 120,
                color: Colors.black12,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewProcessFlow(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: const ListDataDetailsView(),
      ),
    );
  }
}
