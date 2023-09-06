import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';

import '../modules/water_supplier_edit/view/water_supply_edit_page.dart';


class FloatingEvent extends StatelessWidget {
  const FloatingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc,ListDataDetailsState>(
      buildWhen: (previous, current) => previous.waterSupply != current.waterSupply,
      builder: (context,state){
        return SpeedDial(
      icon: Icons.apps_sharp, //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Theme.of(context).primaryColor,
      activeBackgroundColor: Theme.of(context).primaryColor,
      activeForegroundColor: AppColor.white,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: AppColor.black,
      overlayOpacity: 0.5,
      elevation: 8.0, //shadow elevation of button
      shape: const CircleBorder(), //shape of button
      children: [
        SpeedDialChild(
          //speed dial child
          child: const Icon(Icons.save),
          backgroundColor: AppColor.active,
          foregroundColor: AppColor.white,
          label: 'ដាក់ស្នើ',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            if(state.waterSupply!.status.id == 3){
              Blurry(
                title: 'ដាក់ស្នើ',
                description: 'តើអ្នកចង់ដាក់ស្នើទិន្នន័យនេះមែនទេ?',
                confirmButtonText: 'Confirm',
                onConfirmButtonPressed:()=>_onSubmitDrated(context),
                themeColor: AppColor.inactive,
                icon: Icons.delete_outline_rounded,
              ).show(context);
            }else{
              //Navigator.pop(context);
              Navigator.of(context).pop();
            }
            

          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.edit),
          backgroundColor: Colors.blue,
          foregroundColor: AppColor.white,
          label: 'កែតម្រូវ',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return WaterSupplyEditPage(
                          title: 'Edit',
                          waterSupplyId: state.waterSupplyId,
                          id: 1,
                        );
                      },
                    ),
                  );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.delete),
          foregroundColor: AppColor.white,
          backgroundColor: AppColor.inactive,
          label: 'លុប',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            Blurry(
              title: 'Delete',
              description: 'Do you want to delete this Draft?',
              confirmButtonText: 'Confirm',
              onConfirmButtonPressed:()=>_onDeleteSubmited(context),
              themeColor: AppColor.inactive,
              icon: Icons.delete_outline_rounded,
            ).show(context);
          },
        ),
      ],
    ); 
      }
      );
    
  }

  void _onDeleteSubmited(BuildContext context){
    FocusScope.of(context).unfocus();
    context.read<ListDataDetailsBloc>().add(const DeleteSubmited());
  }

  void _onSubmitDrated(BuildContext context){
    FocusScope.of(context).unfocus();
    context.read<ListDataDetailsBloc>().add(const SubmitDrafted());
  }


}
