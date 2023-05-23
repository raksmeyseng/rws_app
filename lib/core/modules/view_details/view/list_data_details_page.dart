import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';
import 'package:rws_app/core/modules/view_details/respository/list_data_detail_repository.dart';
import 'package:rws_app/core/modules/view_details/view/list_data_details_view.dart';
import 'package:rws_app/core/modules/view_details/view_process_flow/view_process.dart';
import 'package:rws_app/core/widgets/floating_event.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_outlined_button.dart';

import '../../../../config/routes/application.dart';
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

    // return BlocBuilder<ListDataDetailsBloc,ListDataDetailsState>(
    //   buildWhen: (previous,current)=>previous.status!=current.status,
    //   builder: (context,state){
    //     return Scaffold(
    //     appBar: AppBar(
    //       title: TextWidget(title, color: AppColor.white),
    //       backgroundColor: Theme.of(context).primaryColor,
    //       leading: IconButton(
    //         icon: const Icon(
    //           Icons.arrow_back,
    //           color: AppColor.white,
    //         ),
    //         onPressed: () => Navigator.of(context).pop(),
    //       ),
    //       actions: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.all(10),
    //           child: MyButton(
    //             title: 'លំហូរដំណើរការ',
    //             maxWidth: 120,
    //             color: Colors.black12,
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => const ViewProcessFlow(),
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //     body: const ListDataDetailsView(),
    //     floatingActionButton: const _FloatingActionButton(),
    //     bottomNavigationBar: const _BottomNavigationBar(),
    //   );
    //   },
    //   );

    return BlocProvider(
      create: (context) => ListDataDetailsBloc(
        repository: ListDataDetailRepository(),
        waterSupplyId: waterSupplyId,
      )..add(const ListDataStarted()),
      child: const _DetailBody(),
      // child: Scaffold(
      //   appBar: AppBar(
      //     title: TextWidget(title, color: AppColor.white),
      //     backgroundColor: Theme.of(context).primaryColor,
      //     leading: IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: AppColor.white,
      //       ),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      //     actions: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: MyButton(
      //           title: 'លំហូរដំណើរការ',
      //           maxWidth: 120,
      //           color: Colors.black12,
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => const ViewProcessFlow(),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      //   body: const ListDataDetailsView(),
      //   floatingActionButton: const _FloatingActionButton(),
      //   bottomNavigationBar: const _BottomNavigationBar(),
      // ),
    );
  }
}

class _DetailBody extends StatelessWidget{

  const _DetailBody();
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
        appBar: AppBar(
          title:const TextWidget('', color: AppColor.white),
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
                      builder: (context) => ViewProcessFlow(
                        workflows: state.waterSupply!.workflows??[],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: const ListDataDetailsView(),
        floatingActionButton: const _FloatingActionButton(),
        bottomNavigationBar: const _BottomNavigationBar(),
      );
      },
    ); 
  }

}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if(state.status == BaseStatusEnum.success){
          if(state.waterSupply!.status.id==3){
            return const FloatingEvent();
          }
          else {
            return const SizedBox.shrink();
          }
        }
        else{
          return const SizedBox.shrink();
        }
          
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        switch(state.status){
          case BaseStatusEnum.success:
            final isProvincialHead = Application.authBloc.state.userToken?.user.isProvincialDepartmentHead??false;
            final provincialDepartmentHeadProvinceId=Application.authBloc.state.userToken?.user.provincialDepartmentHeadProvinceId??0;

            if(isProvincialHead && state.waterSupply!.status.id == 1 && state.waterSupply!.address.id == provincialDepartmentHeadProvinceId){
              return const _ApprovalButtonBar();
            }
            else 
            {
              return const SizedBox.shrink();
            }

            
          default:
            return const SizedBox.shrink();
        }
        
      },
    );
  }
}

class _ApprovalButtonBar extends StatelessWidget{

  const _ApprovalButtonBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyOutlinedButton(
                      title: 'Reject',
                      color: AppColor.inactive,
                      onPressed: () {
                        print('reject!');
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyButton(
                      title: 'Approve',
                      color: AppColor.active,
                      onPressed: () {
                        print('approve');
                      },
                    ),
                  )
                ],
              ),
            );
          
      },
    );
  }

}
