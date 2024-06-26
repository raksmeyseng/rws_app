import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/area_enum.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/budget_type.dart';
import 'package:rws_app/core/enum/capacity_type_enum.dart';
import 'package:rws_app/core/enum/check_water_quality_enum.dart';
import 'package:rws_app/core/enum/filter_enum.dart';
import 'package:rws_app/core/enum/management_type.dart';
import 'package:rws_app/core/enum/map_type_enum.dart';
import 'package:rws_app/core/enum/pond_filter_enum.dart';
import 'package:rws_app/core/enum/pond_status_enum.dart';
import 'package:rws_app/core/enum/pond_type_enum.dart';
import 'package:rws_app/core/enum/season_enum.dart';
import 'package:rws_app/core/enum/tank_status_enum.dart';
import 'package:rws_app/core/enum/using_type_enum.dart';
import 'package:rws_app/core/enum/water_quality_enum.dart';
import 'package:rws_app/core/enum/water_supply_type_enum.dart';
import 'package:rws_app/core/enum/well_status_enum.dart';
import 'package:rws_app/core/enum/well_type_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/bloc/water_supply_edit_bloc.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/budget_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/doc_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/management_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/view/water_supply_edit_page.dart';
import 'package:rws_app/core/modules/water_supply_edit_manage/view/water_supply_edit_manage_view.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';

import '../../../../utils/helpers/dialog_helper.dart';
import '../model/input/check_water_quality_input.dart';
import '../model/input/poolfilter_input.dart';
import '../model/input/status_input.dart';
import '../model/input/water_supply_type_input.dart';
import '../model/location_risk_input.dart';
import '../model/water_quality_input.dart';
import '../model/well_type_input.dart';

part 'water_supply_kiosk_view.dart';
part 'water_supply_pond_view.dart';
part 'water_supply_small_pipe_view.dart';

class WaterSupplyEditView extends StatelessWidget {
  const WaterSupplyEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WaterSupplyEditBloc, WaterSupplyEditState>(
      listenWhen: (previous, current) =>
          previous.formzStatus != current.formzStatus,
      listener: (context, state) {
        if (state.formzStatus == FormzStatus.submissionSuccess) {
          //Application.router.goNamed(AppRoute.home, extra: {'index': '2'});
          Future.delayed(
              Duration.zero,
              () => _dialogBuilder(
                  context,
                  S.of(context).data_saved_successfully,
                  false,
                  state.waterSupplyTypeId));
        } else if (state.formzStatus == FormzStatus.submissionSuccess) {
          Future.delayed(
              Duration.zero,
              () => _dialogBuilder(context, S.of(context).data_save_failed,
                  true, state.waterSupplyTypeId));
        }
      },
      child: BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case BaseStatusEnum.success:
              return const _SuccessView();
            case BaseStatusEnum.failure:
              return const _FailureView();
            default:
              return const _LoadingView();
          }
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String message,
      bool isError, int? waterSupplyTypeId) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          // content: const Text(
          //   '',
          // ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(S.of(context).add_new_data),
              onPressed: () {
                if (isError) {
                  Navigator.of(context).pop();
                } else {
                  // Application.router
                  //     .goNamed(AppRoute.home, extra: {'currentIndex': '2'});
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return WaterSupplyEditPage(
                          title: S.of(context).add_new_data,
                          waterSupplyId: waterSupplyTypeId ?? 1,
                        );
                      },
                    ),
                  );
                }
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(S.of(context).close),
              onPressed: () {
                if (isError) {
                  Navigator.of(context).pop();
                } else {
                  Application.router
                      .goNamed(AppRoute.home, extra: {'currentIndex': '2'});
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) {
                  //       return const WaterSupplyEditPage(
                  //         title: 'បង្កើតថ្មី',
                  //         waterSupplyId: 1,
                  //       );
                  //     },
                  //   ),
                  // );
                }

                // Application.router.goNamed(AppRoute.myTask);
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// ===================
// Success View
// ===================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.formzStatus != current.formzStatus,
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TabBar(),
                    Expanded(child: _TabBarView()),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FlatCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  child: state.formzStatus == FormzStatus.submissionInProgress
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: MyButton(
                                    title: S.of(context).button_draft,
                                    color: AppColor.active,
                                    onPressed: () {
                                      context
                                          .read<WaterSupplyEditBloc>()
                                          .add(const Submitted(3));
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MyButton(
                                  title: S.of(context).button_submit_request,
                                  color: AppColor.active,
                                  onPressed: () {
                                    context
                                        .read<WaterSupplyEditBloc>()
                                        .add(const Submitted(1));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                  // : MyButton(
                  //     title: S.of(context).button_ok,
                  //     onPressed: () {
                  //       context
                  //           .read<WaterSupplyEditBloc>()
                  //           .add(const Submitted());
                  //     },
                  //   ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ===================
// Failure View
// ===================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadDataFailed());
  }
}

// ===================
// Loading View
// ===================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
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
      tabs: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: S.of(context).location_on_map),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: S.of(context).tab_general),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Tab(text: S.of(context).tab_specific),
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
        _FirstInputPage(),
        _SecondInputPage(),
        _ThirdInputPage(),
      ],
    );
  }
}

class _FirstInputPage extends StatelessWidget {
  const _FirstInputPage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _FormField1(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondInputPage extends StatelessWidget {
  const _SecondInputPage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _FormField2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ThirdInputPage extends StatelessWidget {
  const _ThirdInputPage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrapper(
            maxWidth: appSmallMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _FormField3(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormField1 extends StatelessWidget {
  const _FormField1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _ProvinceInput()),
          SizedBox(width: 16),
          Expanded(child: _DistrictInput()),
        ],
      ),
      const SizedBox(height: 16),
      const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _CommuneInput()),
          SizedBox(width: 16),
          Expanded(child: _VillageInput()),
        ],
      ),
      const SizedBox(height: 16),
      const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _MapTypeInput()),
        ],
      ),
      const SizedBox(height: 16),
      const _MapTypeDynamicForm(),
      //bottom padding
      const SizedBox(height: 30),
      _BuildMap()
    ]);
  }
}

class _BuildMap extends StatelessWidget {
  _BuildMap({Key? key}) : super(key: key);

  final pos = getCurrentPosition();

  final CameraPosition position = const CameraPosition(
    target: LatLng(11.5564, 104.9282),
    zoom: 0,
  );

  // var marker = Marker(
  //           //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
  //           markerId: const MarkerId('Current Position'),
  //           position: LatLng(double.parse(ws.decimalDegreeLat),
  //               double.parse(ws.decimalDegreeLng)),
  //           // infoWindow: InfoWindow(
  //           //   title: ws.waterSupplyCode,
  //           //   snippet: ws.waterSupplyCode,
  //           // ),
  //           //icon: BitmapDescriptor.fromBytes(customMarker)
  //           icon: markerIcon,
  //         );
  //         markers.add(marker);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> completer = Completer();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.latLng != current.latLng,
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            SizedBox(
              height: 200, // This line solved the issue
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                scrollGesturesEnabled: true,
                //initialCameraPosition: position,
                initialCameraPosition: CameraPosition(
                  target: LatLng(state.latLng.latitude, state.latLng.longitude),
                  zoom: 0,
                ),
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
                onMapCreated: (controller) {
                  completer.complete(controller);
                  //goToCurrentUserLocation();
                  goToCurrentUserLocation_1(completer, context);
                },
                onTap: (LatLng latLng) => context
                    .read<WaterSupplyEditBloc>()
                    .add(GoogleMapPinChanged(latLng)),
                markers: {
                  Marker(
                    markerId: const MarkerId('current position'),
                    position:
                        LatLng(state.latLng.latitude, state.latLng.longitude),
                  ), // Marker
                },
              ), // Mapbox
            ),
          ],
        );
      },
    );
  }
}

// Widget _buildMap() {
//   Completer<GoogleMapController> completer = Completer();
//   late GoogleMapController newGoogleMapController;
//   final CameraPosition position = const CameraPosition(
//     target: LatLng(11.5564, 104.9282),
//     zoom: 0,
//   );

//   return Stack(
//     children: <Widget>[
//       SizedBox(
//         height: 200, // This line solved the issue
//         child: GoogleMap(
//           mapType: MapType.normal,
//           myLocationButtonEnabled: true,
//           myLocationEnabled: true,
//           initialCameraPosition: position,
//           onMapCreated: (controller) {
//             completer.complete(controller);
//             newGoogleMapController = controller;
//             //goToCurrentUserLocation();
//             goToCurrentUserLocation_1(completer);
//           },
//           onTap: (LatLng latLng) {
//             // you have latitude and longitude here
//             var latitude = latLng.latitude;
//             var longitude = latLng.longitude;
//           },
//           //markers: markers,
//         ), // Mapbox
//       ),
//     ],
//   );
// }

Future<void> goToCurrentUserLocation_1(
    Completer<GoogleMapController> completer, BuildContext context,
    {double zoom = 10}) async {
  try {
    final bloc = context.read<WaterSupplyEditBloc>();
    final GoogleMapController controller = await completer.future;

    final pos = await getCurrentPosition();
    if (pos != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(pos.latitude, pos.longitude),
            //target: const LatLng(11.562108, 104.888535),
            zoom: zoom,
          ),
        ),
      );
      bloc.add(GoogleMapPinChanged(LatLng(pos.latitude, pos.longitude)));
      //GoogleMapPinChanged(LatLng(pos.latitude, pos.longitude));
    }
  } catch (e) {
    print(e);
  }
}

Future<Set<Marker>> getMapMarker() async {
  Set<Marker> markers = <Marker>{};
  try {
    final pos = await getCurrentPosition();
    if (pos != null) {
      var marker = Marker(
        //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
        markerId: const MarkerId('Current Postion'),
        position: LatLng(pos.latitude, pos.longitude),

        // //icon: BitmapDescriptor.fromBytes(customMarker)
        // icon: markerIcon,
      );

      markers.add(marker);
    }
  } catch (e) {
    print(e);
  }
  return markers;
}

class _FormField2 extends StatelessWidget {
  const _FormField2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _FamilyTotalInput()),
            SizedBox(width: 16),
            Expanded(child: _BudgetTypeInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _LocationRiskInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ManagementTypeInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ManagamentNameInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverTotalInput()),
            SizedBox(width: 16),
            Expanded(child: _ReceiverTotalAsFemaleInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverFamilyTotalInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverFamilyPoor1Input()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverFamilyPoor2Input()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverFamilyIndigenousInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReceiverFamilyVulnearableInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ConstructionCodeInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _DateOfConstructionInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CompanyNameInput()),
          ],
        ),
        //bottom padding
        SizedBox(height: 30),
      ],
    );
  }
}

class _FormField3 extends StatelessWidget {
  const _FormField3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      builder: (context, state) {
        switch (state.waterSupplyTypeId) {
          case 1:
            return const _WellInputPage();
          case 2:
            return const _SPipeInputPage();
          case 3:
            return const _KoiskInputPage();
          //return const _SPipeInputPage();
          case 4:
            return const _PondInputPage();
          case 5:
            return const _RainInputPage();
          case 6:
            return const _PipeInputPage();
          case 7:
            return const _AirInputPage();
          default:
            return const _WellInputPage();
        }
      },
    );
  }
}

class _WellInputPage extends StatefulWidget {
  const _WellInputPage({Key? key}) : super(key: key);

  @override
  State<_WellInputPage> createState() => _WellInputPageState();
}

class _WellInputPageState extends State<_WellInputPage> {
  int valueCallBack = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WellTypeInput()),
            SizedBox(width: 16),
            Expanded(child: _WellDepthInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WellScreenInput()),
            SizedBox(width: 16),
            Expanded(child: _WellThearInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _NiVoStaticInput()),
            SizedBox(width: 16),
            Expanded(child: _NiVoDynamicInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WaterQualityInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _CheckWaterQualityInput(
                voidCallback: (value) {
                  setState(() {
                    valueCallBack = value;
                    print('value is : $valueCallBack');
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WellStatusInput()),
          ],
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: valueCallBack == 0 ? true : false,
          child: const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: WaterSupplyEditManageView()),
                SizedBox(width: 16),
                Expanded(child: WaterSupplyEditManageTextBox()),
              ],
            ),
          ),
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _SPipeInputPage extends StatelessWidget {
  const _SPipeInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WaterSupplyTypeInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ContainerInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CapacityInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _AirPoolInput()),
            SizedBox(width: 16),
            Expanded(child: _FilterTankInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ConnectorInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PipeLenghtInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PipeStatusInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _QualityWaterCheckInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CoverageInput()),
          ],
        ),

        //bottom padding
        SizedBox(height: 30),
      ],
    );
  }
}

class _KoiskInputPage extends StatelessWidget {
  const _KoiskInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WaterSupplyTypeInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _AbilityProductWaterInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _KioskFilterInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _QualityWaterCheckInput()),
          ],
        ),
        //bottom padding
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _KioskStatusInput()),
          ],
        ),
      ],
    );
  }
}

class _PondInputPage extends StatelessWidget {
  const _PondInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PondLatInput()),
            SizedBox(width: 16),
            Expanded(child: _PondLongInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PondDepthInput()),
            SizedBox(width: 16),
            Expanded(child: _PondFilterInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PondTypeInput()),
            SizedBox(width: 16),
            Expanded(child: _SeasonInput()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PondStatusInput()),
          ],
        ),
        //bottom padding
        SizedBox(height: 30),
      ],
    );
  }
}

class _RainInputPage extends StatefulWidget {
  const _RainInputPage({Key? key}) : super(key: key);

  @override
  State<_RainInputPage> createState() => _RainInputPageState();
}

class _RainInputPageState extends State<_RainInputPage> {
  int valueCallBack = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _UsingTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CapacityTypeInput()),
            SizedBox(width: 16),
            Expanded(child: _TankStatusInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _CheckWaterQualityInput(
                voidCallback: (value) {
                  setState(() {
                    valueCallBack = value;
                    print('value is : $valueCallBack');
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: valueCallBack == 0 ? true : false,
          child: const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: WaterSupplyEditManageView()),
                SizedBox(width: 16),
                Expanded(child: WaterSupplyEditManageTextBox()),
              ],
            ),
          ),
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _PipeInputPage extends StatefulWidget {
  const _PipeInputPage({Key? key}) : super(key: key);

  @override
  State<_PipeInputPage> createState() => _PipeInputPageState();
}

class _PipeInputPageState extends State<_PipeInputPage> {
  int valueCallBack = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WaterSupplyTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        //'សមត្ថភាពផលិតទឹក(m3/h)'
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CapacityInput()),
          ],
        ),
        const SizedBox(height: 16),
        //អាងស្តុបទឹកក្រោមដី(m3)
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ContainerInput()),
          ],
        ),
        const SizedBox(height: 16),
        //'អាងអាកាស (m)'
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _AirPoolInput()),
          ],
        ),

        const SizedBox(height: 16),
        //'អាងចម្រោះ'
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _FilterTankInput()),
            SizedBox(width: 16),
            Expanded(child: _ConnectorInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _CheckWaterQualityInput(
                voidCallback: (value) {
                  setState(() {
                    valueCallBack = value;
                    print('value is : $valueCallBack');
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CoverageInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _SupplierInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _SupplierDateInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _DueDateInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PipeLenghtInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _PipeStatusInput()),
          ],
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: valueCallBack == 0 ? true : false,
          child: const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: WaterSupplyEditManageView()),
                SizedBox(width: 16),
                Expanded(child: WaterSupplyEditManageTextBox()),
              ],
            ),
          ),
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _AirInputPage extends StatelessWidget {
  const _AirInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _WaterSupplyTypeInput()),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CapacityInput()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: _CheckWaterQualityInput(
              voidCallback: (value) {},
            )),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _FilterInput()),
            SizedBox(width: 16),
            Expanded(child: _AirStationInput()),
          ],
        ),
        //bottom padding
        const SizedBox(height: 30),
      ],
    );
  }
}

class _ProvinceInput extends StatelessWidget {
  const _ProvinceInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.provinceInput != current.provinceInput ||
          previous.provinces != current.provinces,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).province,
          focusNode: context.read<WaterSupplyEditBloc>().provinceFocus,
          controller: context.read<WaterSupplyEditBloc>().provinceController,
          onTap: () async {
            final province =
                await DialogHelper.showAnimatedDialog<ProvinceModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                final Locale appLocale = Localizations.localeOf(context);
                return MySimpleDialog(
                    title: S.of(context).province,
                    content: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...state.provinces.map(
                              (pro) => ListTile(
                                onTap: () {
                                  Navigator.of(context).pop(pro);
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                title: TextWidget(
                                  appLocale.languageCode == 'en'
                                      ? pro.nameEn
                                      : pro.nameKh,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            );
            if (province != null) {
              bloc.add(ProvinceChanged(province));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.provinceInput.invalid) return null;
    switch (state.provinceInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_province;
      default:
        return null;
    }
  }
}

class _DistrictInput extends StatelessWidget {
  const _DistrictInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.districtInput != current.districtInput ||
          previous.districts != current.districts,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).district,
          focusNode: context.read<WaterSupplyEditBloc>().districtFocus,
          controller: context.read<WaterSupplyEditBloc>().districtController,
          onTap: () async {
            if (state.districts.isEmpty) return;
            final district =
                await DialogHelper.showAnimatedDialog<DistrictModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                final Locale appLocale = Localizations.localeOf(context);
                return MySimpleDialog(
                  title: S.of(context).district,
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...state.districts.map(
                            (dis) => ListTile(
                              onTap: () {
                                Navigator.of(context).pop(dis);
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              title: TextWidget(
                                appLocale.languageCode == 'en'
                                    ? dis.nameEn
                                    : dis.nameKh,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (district != null) {
              bloc.add(DistrictChanged(district));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.districtInput.invalid) return null;
    switch (state.districtInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_district;
      default:
        return null;
    }
  }
}

class _CommuneInput extends StatelessWidget {
  const _CommuneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.communeInput != current.communeInput ||
          previous.communes != current.communes,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).commune,
          focusNode: context.read<WaterSupplyEditBloc>().communeFocus,
          controller: context.read<WaterSupplyEditBloc>().communeController,
          onTap: () async {
            if (state.communes.isEmpty) return;
            final commnue =
                await DialogHelper.showAnimatedDialog<CommuneModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                final Locale appLocale = Localizations.localeOf(context);
                return MySimpleDialog(
                  title: S.of(context).commune,
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...state.communes.map(
                            (com) => ListTile(
                              onTap: () {
                                Navigator.of(context).pop(com);
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              title: TextWidget(
                                appLocale.languageCode == 'en'
                                    ? com.nameEn
                                    : com.nameKh,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (commnue != null) {
              bloc.add(CommnueChanged(commnue));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.communeInput.invalid) return null;
    switch (state.communeInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_commune;
      default:
        return null;
    }
  }
}

class _VillageInput extends StatelessWidget {
  const _VillageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.villageInput != current.villageInput ||
          previous.villages != current.villages,
      builder: (context, state) {
        final Locale appLocale = Localizations.localeOf(context);
        return MyTextInput(
          label: S.of(context).village,
          focusNode: context.read<WaterSupplyEditBloc>().villageFocus,
          controller: context.read<WaterSupplyEditBloc>().villageController,
          onTap: () async {
            if (state.villages.isEmpty) return;
            final village =
                await DialogHelper.showAnimatedDialog<VillageModel?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).village,
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...state.villages.map(
                            (vill) => ListTile(
                              onTap: () {
                                Navigator.of(context).pop(vill);
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              title: TextWidget(
                                appLocale.languageCode == 'en'
                                    ? vill.nameEn
                                    : vill.nameKh,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            if (village != null) {
              bloc.add(VillageChanged(village));
            }
          },
          isRequired: true,
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.villageInput.invalid) return null;
    switch (state.villageInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).pls_input_village;
      default:
        return null;
    }
  }
}

class _MapTypeInput extends StatelessWidget {
  const _MapTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.mapTypeInput != current.mapTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).map_unit,
          focusNode: bloc.mapTypeFocus,
          controller: bloc.mapTypeController,
          onTap: () async {
            final mapType = await DialogHelper.showAnimatedDialog<MapTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).map_unit,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...MapTypeEnum.values.map(
                          (mapType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(mapType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(mapType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (mapType != null) {
              bloc.add(MapTypeChanged(mapType));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.mapTypeInput.invalid) return null;
//   switch (state.mapTypeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសខ្នាតផែនទី';
//     default:
//       return null;
//   }
// }
}

class _MapTypeDynamicForm extends StatelessWidget {
  const _MapTypeDynamicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.mapTypeInput != current.mapTypeInput,
      builder: (context, state) {
        final mapTypeEnum = state.mapTypeInput.value;
        switch (mapTypeEnum) {
          case MapTypeEnum.utm:
            return const _UtmForm();
          // case MapTypeEnum.decimal:
          //   return const _DecimalForm();
          // case MapTypeEnum.degree:
          //   return const _DegreeForm();
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class _UtmForm extends StatelessWidget {
  const _UtmForm();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _LatInput()),
        SizedBox(width: 16),
        Expanded(child: _LongInput()),
      ],
    );
  }
}

// class _DecimalForm extends StatelessWidget {
//   const _DecimalForm();

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(child: _UTMXInput()),
//         SizedBox(width: 16),
//         Expanded(child: _UTMYInput()),
//       ],
//     );
//   }
// }

// class _DegreeForm extends StatelessWidget {
//   const _DegreeForm();

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: 8.0),
//           child: CaptionWidget('រយៈទទឹង'),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(child: _LatDegreeInput()),
//             SizedBox(width: 16),
//             Expanded(child: _LatMinuteInput()),
//             SizedBox(width: 16),
//             Expanded(child: _LatSecondInput()),
//           ],
//         ),
//         SizedBox(height: 16),
//         Padding(
//           padding: EdgeInsets.only(left: 8.0),
//           child: CaptionWidget('រយៈបណ្តោយ'),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(child: _LongDegreeInput()),
//             SizedBox(width: 16),
//             Expanded(child: _LongMinuteInput()),
//             SizedBox(width: 16),
//             Expanded(child: _LongSecondInput()),
//           ],
//         ),
//       ],
//     );
//   }
// }

class _LatInput extends StatelessWidget {
  const _LatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.lateitudeInput != current.lateitudeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).utm_x,
          focusNode: context.read<WaterSupplyEditBloc>().latetitudeFocus,
          controller: context.read<WaterSupplyEditBloc>().latetitudeController,
          onChanged: (lat) =>
              context.read<WaterSupplyEditBloc>().add(LatetitudeChanged(lat)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.lateitudeInput.invalid) return null;
//   switch (state.lateitudeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលរយៈទទឹង';
//     default:
//       return null;
//   }
// }
}

class _LongInput extends StatelessWidget {
  const _LongInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.longtitudeInput != current.longtitudeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).utm_y,
          focusNode: context.read<WaterSupplyEditBloc>().longtitudeFocus,
          controller: context.read<WaterSupplyEditBloc>().longtitudeController,
          onChanged: (long) =>
              context.read<WaterSupplyEditBloc>().add(LongtitudeChanged(long)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.longtitudeInput.invalid) return null;
//   switch (state.longtitudeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលរយៈបណ្តោយ';
//     default:
//       return null;
//   }
// }
}

// class _UTMXInput extends StatelessWidget {
//   const _UTMXInput({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//     buildWhen: (previous, current) => previous.utmXInput != current.utmXInput,
//     builder: (context, state) {
//       return MyTextInput(
//         label: S.of(context).utm_x,
//         focusNode: context.read<WaterSupplyEditBloc>().utmXFocus,
//         controller: context.read<WaterSupplyEditBloc>().utmXController,
//         onChanged: (y) =>
//             context.read<WaterSupplyEditBloc>().add(UTMXChanged(y)),
//         // errorText: _handleErrorText(context, state),
//         textInputAction: TextInputAction.next,
//         keyboardType: TextInputType.phone,
//       );
//     },
//   );
// }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.utmXInput.invalid) return null;
//   switch (state.utmXInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលកូអរដោនេ UTMX';
//     default:
//       return null;
//   }
// }
// }

// class _UTMYInput extends StatelessWidget {
//   const _UTMYInput({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//     buildWhen: (previous, current) => previous.utmYInput != current.utmYInput,
//     builder: (context, state) {
//       return MyTextInput(
//         label: S.of(context).utm_y,
//         focusNode: context.read<WaterSupplyEditBloc>().utmYFocus,
//         controller: context.read<WaterSupplyEditBloc>().utmYController,
//         onChanged: (y) =>
//             context.read<WaterSupplyEditBloc>().add(UTMYChanged(y)),
//         // errorText: _handleErrorText(context, state),
//         textInputAction: TextInputAction.next,
//         keyboardType: TextInputType.phone,
//       );
//     },
//   );
// }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.utmYInput.invalid) return null;
//   switch (state.utmYInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលកូអរដោនេ UTMY';
//     default:
//       return null;
//   }
// }
// }

// class _LatDegreeInput extends StatelessWidget {
//   const _LatDegreeInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.latDegreeInput != current.latDegreeInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Degree',
//           focusNode: context.read<WaterSupplyEditBloc>().latDegreeFocus,
//           controller: context.read<WaterSupplyEditBloc>().latDegreeController,
//           onChanged: (degree) =>
//               context.read<WaterSupplyEditBloc>().add(LatDegreeChanged(degree)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.latDegreeInput.invalid) return null;
//   switch (state.latDegreeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Degree';
//     default:
//       return null;
//   }
// }
// }

// class _LatSecondInput extends StatelessWidget {
//   const _LatSecondInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.latSecondInput != current.latSecondInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Second',
//           focusNode: context.read<WaterSupplyEditBloc>().latSecondFocus,
//           controller: context.read<WaterSupplyEditBloc>().latSecondController,
//           onChanged: (sec) =>
//               context.read<WaterSupplyEditBloc>().add(LatSecondChanged(sec)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.latSecondInput.invalid) return null;
//   switch (state.latSecondInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Second';
//     default:
//       return null;
//   }
// }
// }

// class _LongDegreeInput extends StatelessWidget {
//   const _LongDegreeInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.longDegreeInput != current.longDegreeInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Degree',
//           focusNode: context.read<WaterSupplyEditBloc>().longDegreeFocus,
//           controller: context.read<WaterSupplyEditBloc>().longDegreeController,
//           onChanged: (degree) => context
//               .read<WaterSupplyEditBloc>()
//               .add(LongDegreeChanged(degree)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.longDegreeInput.invalid) return null;
//   switch (state.longDegreeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Degree';
//     default:
//       return null;
//   }
// }
// }

// class _LongSecondInput extends StatelessWidget {
//   const _LongSecondInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.longSecondInput != current.longSecondInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Second',
//           focusNode: context.read<WaterSupplyEditBloc>().longSecondFocus,
//           controller: context.read<WaterSupplyEditBloc>().longSecondController,
//           onChanged: (sec) =>
//               context.read<WaterSupplyEditBloc>().add(LongSecondChanged(sec)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.longSecondInput.invalid) return null;
//   switch (state.longSecondInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Second';
//     default:
//       return null;
//   }
// }
// }

// class _LatMinuteInput extends StatelessWidget {
//   const _LatMinuteInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.latMinuteInput != current.latMinuteInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Minute',
//           focusNode: context.read<WaterSupplyEditBloc>().latMinuteFocus,
//           controller: context.read<WaterSupplyEditBloc>().latMinuteController,
//           onChanged: (min) =>
//               context.read<WaterSupplyEditBloc>().add(LatMinuteChanged(min)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.latMinuteInput.invalid) return null;
//   switch (state.latMinuteInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Minute';
//     default:
//       return null;
//   }
// }
// }

// class _LongMinuteInput extends StatelessWidget {
//   const _LongMinuteInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
//       buildWhen: (previous, current) =>
//           previous.longMinuteInput != current.longMinuteInput,
//       builder: (context, state) {
//         return MyTextInput(
//           label: 'Minute',
//           focusNode: context.read<WaterSupplyEditBloc>().longMinuteFocus,
//           controller: context.read<WaterSupplyEditBloc>().longMinuteController,
//           onChanged: (min) =>
//               context.read<WaterSupplyEditBloc>().add(LongMinuteChanged(min)),
//           // errorText: _handleErrorText(context, state),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.phone,
//         );
//       },
//     );
//   }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.longMinuteInput.invalid) return null;
//   switch (state.longMinuteInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូល Minute';
//     default:
//       return null;
//   }
// }
// }

class _FamilyTotalInput extends StatelessWidget {
  const _FamilyTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.familyTotalInput != current.familyTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).total_family,
          focusNode: context.read<WaterSupplyEditBloc>().familyTotalFocus,
          controller: context.read<WaterSupplyEditBloc>().familyTotalController,
          onChanged: (total) => context
              .read<WaterSupplyEditBloc>()
              .add(FamilyTotalChanged(total)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.familyTotalInput.invalid) return null;
//   switch (state.familyTotalInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលគ្រួសារសរុប';
//     default:
//       return null;
//   }
// }
}

class _LocationRiskInput extends StatelessWidget {
  const _LocationRiskInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.locationRickInput != current.locationRickInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).risk_enviroment,
          focusNode: context.read<WaterSupplyEditBloc>().locationRickFocus,
          controller:
              context.read<WaterSupplyEditBloc>().locationRickController,
          onTap: () async {
            final area = await DialogHelper.showAnimatedDialog<AreaEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).environmental_risk_area,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...AreaEnum.values.map(
                          (areaType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(areaType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(areaType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (area != null) {
              bloc.add(LocationRickChanged(area));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.locationRickInput.invalid) return null;
    switch (state.locationRickInput.error) {
      case LocationRiskInputValidationError.empty:
        return S.of(context).select_environmental_risk_area_error;
      default:
        return null;
    }
  }
}

class _BudgetTypeInput extends StatelessWidget {
  const _BudgetTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.budgetTypeInput != current.budgetTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).budget_source,
          focusNode: context.read<WaterSupplyEditBloc>().budgetTypeFocus,
          controller: context.read<WaterSupplyEditBloc>().budgetTypeController,
          onTap: () async {
            final budget =
                await DialogHelper.showAnimatedDialog<BudgetTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).budget_type,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...BudgetTypeEnum.values.map(
                          (budgetType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(budgetType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(budgetType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (budget != null) {
              bloc.add(BudgetTypeChanged(budget));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.budgetTypeInput.invalid) return null;
    switch (state.budgetTypeInput.error) {
      case BudgetTypeInputValidationError.empty:
        return S.of(context).select_budget_type_error;
      default:
        return null;
    }
  }
}

class _ManagementTypeInput extends StatelessWidget {
  const _ManagementTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.managementTypeInput != current.managementTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).management_type,
          focusNode: context.read<WaterSupplyEditBloc>().managementTypeFocus,
          controller:
              context.read<WaterSupplyEditBloc>().managementTypeController,
          onTap: () async {
            final manage =
                await DialogHelper.showAnimatedDialog<ManagementTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).management_type,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...ManagementTypeEnum.values.map(
                          (manageType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(manageType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(manageType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (manage != null) {
              bloc.add(ManagementTypeChanged(manage));
            }
          },
          errorText: _handleErrorText(context, state),
          isRequired: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.managementTypeInput.invalid) return null;
    switch (state.managementTypeInput.error) {
      case ManagementTypeInputValidationError.empty:
        return S.of(context).select_management_type_error;
      default:
        return null;
    }
  }
}

class _ManagamentNameInput extends StatelessWidget {
  const _ManagamentNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.managementNameInput != current.managementNameInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).managed_by,
          focusNode: context.read<WaterSupplyEditBloc>().managementNameFocus,
          controller:
              context.read<WaterSupplyEditBloc>().managementNameController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ManagementNameChanged(value)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.managementNameInput.invalid) return null;
//   switch (state.managementNameInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលឈ្មោះអ្នកគ្រប់គ្រង';
//     default:
//       return null;
//   }
// }
}

class _ReceiverTotalInput extends StatelessWidget {
  const _ReceiverTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverTotalInput != current.receiverTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_people,
          focusNode: context.read<WaterSupplyEditBloc>().receiverTotalFocus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverTotalController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverTotalChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverTotalInput.invalid) return null;
    switch (state.receiverTotalInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).input_total_people_benefice_error;
      default:
        return null;
    }
  }
}

class _ReceiverTotalAsFemaleInput extends StatelessWidget {
  const _ReceiverTotalAsFemaleInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverTotalAsFemaleInput !=
          current.receiverTotalAsFemaleInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_women,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverTotalAsFemaleFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverTotalAsFemaleController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverTotalAsFemaleChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverTotalAsFemaleInput.invalid) return null;
    switch (state.receiverTotalAsFemaleInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_women_error;
      default:
        return null;
    }
  }
}

class _ReceiverFamilyTotalInput extends StatelessWidget {
  const _ReceiverFamilyTotalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyTotalInput != current.receiverFamilyTotalInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_family,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyTotalFocus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyTotalController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyTotalChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyTotalInput.invalid) return null;
    switch (state.receiverFamilyTotalInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_family_error;
      default:
        return null;
    }
  }
}

class _ReceiverFamilyPoor1Input extends StatelessWidget {
  const _ReceiverFamilyPoor1Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyPoor1Input != current.receiverFamilyPoor1Input,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_family_poor_1,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor1Focus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor1Controller,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyPoor1Changed(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyPoor1Input.invalid) return null;
    switch (state.receiverFamilyPoor1Input.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_family_poor_1_error;
      default:
        return null;
    }
  }
}

class _ReceiverFamilyPoor2Input extends StatelessWidget {
  const _ReceiverFamilyPoor2Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyPoor2Input != current.receiverFamilyPoor2Input,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_family_poor_2,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor2Focus,
          controller:
              context.read<WaterSupplyEditBloc>().receiverFamilyPoor2Controller,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyPoor2Changed(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyPoor2Input.invalid) return null;
    switch (state.receiverFamilyPoor2Input.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_family_poor_2_error;
      default:
        return null;
    }
  }
}

class _ReceiverFamilyIndigenousInput extends StatelessWidget {
  const _ReceiverFamilyIndigenousInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyIndigenousInput !=
          current.receiverFamilyIndigenousInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_family_indigenous,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyMinorityFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverFamilyMinorityController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyMinorityChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyIndigenousInput.invalid) return null;
    switch (state.receiverFamilyIndigenousInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_family_indigenous_error;
      default:
        return null;
    }
  }
}

class _ReceiverFamilyVulnearableInput extends StatelessWidget {
  const _ReceiverFamilyVulnearableInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.receiverFamilyVulnearableInput !=
          current.receiverFamilyVulnearableInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).beneficiary_total_family_vulnerable,
          focusNode:
              context.read<WaterSupplyEditBloc>().receiverFamilyVictimFocus,
          controller: context
              .read<WaterSupplyEditBloc>()
              .receiverFamilyVictimController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ReceiverFamilyVictimChanged(value)),
          errorText: _handleErrorText(context, state),
          isRequired: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.receiverFamilyVulnearableInput.invalid) return null;
    switch (state.receiverFamilyVulnearableInput.error) {
      case WaterSupplyInputValidationError.empty:
        return S.of(context).beneficiary_total_family_vulnerable_error;
      default:
        return null;
    }
  }
}

class _DateOfConstructionInput extends StatelessWidget {
  const _DateOfConstructionInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) => previous.docInput != current.docInput,
      builder: (context, state) {
        final bloc = context.read<WaterSupplyEditBloc>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextInput(
              label: S.of(context).construction_date,
              controller: context.read<WaterSupplyEditBloc>().docController,
              onTap: () async {
                final date = await _pickDate(context);
                if (date != null) {
                  bloc.add(DOCChanged(date));
                }
              },
              readOnly: true,
              isRequired: true,
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
              errorText: _handleErrorText(context, state),
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.docInput.invalid) return null;
    switch (state.docInput.error) {
      case DOCInputValidationError.empty:
        return S.of(context).select_construction_date_error;
      default:
        return null;
    }
  }

  Future<DateTime?> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: context.read<WaterSupplyEditBloc>().state.docInput.value ??
            DateTime.now(),
        firstDate: DateHelper.calendarFirstDate(),
        lastDate: DateHelper.calendarLastDate(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                    onPrimary: Colors.black, // selected text color
                    onSurface: Colors.amberAccent, // default text color
                    primary: Colors.amberAccent // circle color
                    ),
                dialogBackgroundColor: Colors.black54,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand'),
                        primary: Colors.amber, // color of button's letters
                        backgroundColor: Colors.black54, // Background color
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50))))),
            child: child!,
          );
        });
    return date;
  }
}

class _CompanyNameInput extends StatelessWidget {
  const _CompanyNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.companyNameInput != current.companyNameInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).construction_by,
          focusNode: context.read<WaterSupplyEditBloc>().companyNameFocus,
          controller: context.read<WaterSupplyEditBloc>().companyNameController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(CompanyNameChanged(value)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.companyNameInput.invalid) return null;
//   switch (state.companyNameInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលសាងសង់ដោយក្រុមហ៊ុន';
//     default:
//       return null;
//   }
// }
}

class _ConstructionCodeInput extends StatelessWidget {
  const _ConstructionCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.constructionCodeInput != current.constructionCodeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).water_supply_code,
          focusNode: context.read<WaterSupplyEditBloc>().constructionCodeFocus,
          controller:
              context.read<WaterSupplyEditBloc>().constructionCodeController,
          onChanged: (value) => context
              .read<WaterSupplyEditBloc>()
              .add(ConstructionCodeChanged(value)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.constructionCodeInput.invalid) return null;
//   switch (state.constructionCodeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលលេខកូដសំណង់';
//     default:
//       return null;
//   }
// }
}

class _WellTypeInput extends StatelessWidget {
  const _WellTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellTypeInput != current.wellTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_type,
          focusNode: bloc.wellTypeFocus,
          controller: bloc.wellTypeController,
          onTap: () async {
            final wellType =
                await DialogHelper.showAnimatedDialog<WellTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).well_type,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellTypeEnum.values.map(
                          (wellType) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(wellType);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(wellType.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (wellType != null) {
              bloc.add(WellTypeChanged(wellType));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.wellTypeInput.invalid) return null;
    switch (state.wellTypeInput.error) {
      case WellTypeInputValidatorError.empty:
        return S.of(context).well_type_error;
      default:
        return null;
    }
  }
}

class _WellDepthInput extends StatelessWidget {
  const _WellDepthInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellDepthInput != current.wellDepthInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_depth,
          focusNode: context.read<WaterSupplyEditBloc>().wellDepthFocus,
          controller: context.read<WaterSupplyEditBloc>().wellDepthController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellDepthChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.wellDepthInput.invalid) return null;
//   switch (state.wellDepthInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលជម្រៅអណ្តូង(m)';
//     default:
//       return null;
//   }
// }
}

class _WellScreenInput extends StatelessWidget {
  const _WellScreenInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellScreenInput != current.wellScreenInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_screen,
          focusNode: context.read<WaterSupplyEditBloc>().wellScreenFocus,
          controller: context.read<WaterSupplyEditBloc>().wellScreenController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellScreenChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.wellScreenInput.invalid) return null;
//   switch (state.wellScreenInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលជម្រៅតម្រង (Screen) (m)';
//     default:
//       return null;
//   }
// }
}

class _WellThearInput extends StatelessWidget {
  const _WellThearInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellThearInput != current.wellThearInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_water_supply,
          focusNode: context.read<WaterSupplyEditBloc>().wellThearFocus,
          controller: context.read<WaterSupplyEditBloc>().wellThearController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(WellThearChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.wellThearInput.invalid) return null;
//   switch (state.wellThearInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលធារទឹក (m3/h)';
//     default:
//       return null;
//   }
// }
}

class _WaterQualityInput extends StatelessWidget {
  const _WaterQualityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.waterQualityInput != current.waterQualityInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).water_quality,
          focusNode: bloc.waterQualityFocus,
          controller: bloc.waterQualityController,
          onTap: () async {
            final type =
                await DialogHelper.showAnimatedDialog<WaterQualityEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).water_quality,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WaterQualityEnum.values.map(
                          (quality) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(quality);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(quality.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(WaterQualityChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.waterQualityInput.invalid) return null;
    switch (state.waterQualityInput.error) {
      case WaterQualityInputValidationError.empty:
        return S.of(context).select_water_quality_error;
      default:
        return null;
    }
  }
}

class _NiVoStaticInput extends StatelessWidget {
  const _NiVoStaticInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.niVoStaticInput != current.niVoStaticInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_nirostatic,
          focusNode: context.read<WaterSupplyEditBloc>().niVoStaticFocus,
          controller: context.read<WaterSupplyEditBloc>().niVoStaticController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(NiVoStaticChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.niVoStaticInput.invalid) return null;
//   switch (state.niVoStaticInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលនីវ៉ូស្តាទិច (m)';
//     default:
//       return null;
//   }
// }
}

class _NiVoDynamicInput extends StatelessWidget {
  const _NiVoDynamicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.niVoDynamicInput != current.niVoDynamicInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_nirodynamic,
          focusNode: context.read<WaterSupplyEditBloc>().niVoDynamicFocus,
          controller: context.read<WaterSupplyEditBloc>().niVoDynamicController,
          onChanged: (val) =>
              context.read<WaterSupplyEditBloc>().add(NiVoDynamicChanged(val)),
          // errorText: _handleErrorText(context, state),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.niVoDynamicInput.invalid) return null;
//   switch (state.niVoDynamicInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមបញ្ចូលនីវ៉ូឌីណាមិច (m)';
//     default:
//       return null;
//   }
// }
}

class _CheckWaterQualityInput extends StatelessWidget {
  const _CheckWaterQualityInput({Key? key, required this.voidCallback})
      : super(key: key);
  final Function(int) voidCallback;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.checkWaterQualityInput != current.checkWaterQualityInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_check_water_quality,
          focusNode: bloc.checkWaterQualityFocus,
          controller: bloc.checkWaterQualityController,
          onTap: () async {
            final type =
                await DialogHelper.showAnimatedDialog<CheckWaterQualityEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).well_check_water_quality,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...CheckWaterQualityEnum.values.map(
                          (check) => ListTile(
                            onTap: () {
                              voidCallback(check.index);
                              Navigator.of(context).pop(check);
                              // print('test : ${voidCallback()}');
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(check.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(CheckWaterQualityChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.checkWaterQualityInput.invalid) return null;
    switch (state.checkWaterQualityInput.error) {
      case CheckWaterQualityInputValidationError.empty:
        return S.of(context).select_well_check_water_quality_error;
      default:
        return null;
    }
  }
}

class _WellStatusInput extends StatelessWidget {
  const _WellStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.wellStatusInput != current.wellStatusInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_status,
          focusNode: bloc.wellStatusFocus,
          controller: bloc.wellStatusController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<WellStatusEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).well_status,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellStatusEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(WellStatusChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.wellStatusInput.invalid) return null;
    switch (state.wellStatusInput.error) {
      case WellStatusInputValidationError.empty:
        return S.of(context).select_well_status_error;
      default:
        return null;
    }
  }
}

class _QualityWaterCheckInput extends StatelessWidget {
  const _QualityWaterCheckInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.qualityWaterCheckInput != current.qualityWaterCheckInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).well_check_water_quality,
          focusNode: bloc.qualityWaterCheckFocus,
          controller: bloc.qualityWaterCheckController,
          onTap: () async {
            final type =
                await DialogHelper.showAnimatedDialog<WaterQualityEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).well_check_water_quality,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WaterQualityEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(QualityWaterCheckChanged(type));
            }
          },
          errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          isRequired: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
    if (!state.qualityWaterCheckInput.invalid) return null;
    switch (state.qualityWaterCheckInput.error) {
      case WaterQualityInputValidationError.empty:
        return S.of(context).select_well_check_water_quality_error;
      default:
        return null;
    }
  }
}

class _UsingTypeInput extends StatelessWidget {
  const _UsingTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.usingTypeInput != current.usingTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).type_of_using,
          focusNode: bloc.usingTypeFocus,
          controller: bloc.usingTypeController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<UsingTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).type_of_using,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...UsingTypeEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(UsingTypeChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.usingTypeInput.invalid) return null;
//   switch (state.usingTypeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសប្រភេទនៃការប្រើប្រាស់';
//     default:
//       return null;
//   }
// }
}

class _TankStatusInput extends StatelessWidget {
  const _TankStatusInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.tankStatusInput != current.tankStatusInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).status_rain_water_harvesting,
          focusNode: bloc.tankStatusFocus,
          controller: bloc.tankStatusController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<TankStatusEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).status_rain_water_harvesting,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...TankStatusEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(TankStatusChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.tankStatusInput.invalid) return null;
//   switch (state.tankStatusInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសស្ថានភាពអាង';
//     default:
//       return null;
//   }
// }
}

class _CapacityTypeInput extends StatelessWidget {
  const _CapacityTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.capacityTypeInput != current.capacityTypeInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).capacity_of_rain_water_harvesting,
          focusNode: bloc.capacityTypeFocus,
          controller: bloc.capacityTypeController,
          onTap: () async {
            final type =
                await DialogHelper.showAnimatedDialog<CapacityTypeEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).capacity_of_rain_water_harvesting,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...CapacityTypeEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(CapacityTypeChanged(type));
            }
          },
          //errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.capacityTypeInput.invalid) return null;
//   switch (state.capacityTypeInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសចំណុះ';
//     default:
//       return null;
//   }
// }
}

class _SupplierInput extends StatelessWidget {
  const _SupplierInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.supplierInput != current.supplierInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).label_is_has_license,
          focusNode: bloc.supplierFocus,
          controller: bloc.supplierController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<FilterEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).label_is_has_license,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...FilterEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(SupplierChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.supplierInput.invalid) return null;
//   switch (state.supplierInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសអាជ្ញាបណ្ណ';
//     default:
//       return null;
//   }
// }
}

class _SupplierDateInput extends StatelessWidget {
  const _SupplierDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.supplierDateInput != current.supplierDateInput,
      builder: (context, state) {
        final bloc = context.read<WaterSupplyEditBloc>();
        return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: const Color(0xFFFF3661), //color of the main banner
              //accentColor: Color(0xFFFF3661), //color of circle indicating the selected date
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme
                      .accent //color of the text in the button "OK/CANCEL"
                  ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextInput(
                  label: S.of(context).label_license_registered_date,
                  controller: context
                      .read<WaterSupplyEditBloc>()
                      .supplierDateController,
                  onTap: () async {
                    final date = await _pickDate(context);
                    if (date != null) {
                      bloc.add(SupplierDateChanged(date));
                    }
                  },
                  readOnly: true,
                  suffixIcon: const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                  ),
                  // errorText: _handleErrorText(context, state),
                ),
              ],
            ));
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.supplierDateInput.invalid) return null;
  //   switch (state.supplierDateInput.error) {
  //     case DOCInputValidationError.empty:
  //       return 'សូមជ្រើសរើសថ្ងៃ ខែ ឆ្នាំទទួលបានអាជ្ញាបណ្ណ';
  //     default:
  //       return null;
  //   }
  // }

  Future<DateTime?> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate:
            context.read<WaterSupplyEditBloc>().state.supplierDateInput.value ??
                DateTime.now(),
        firstDate: DateHelper.calendarFirstDate(),
        lastDate: DateHelper.calendarLastDate(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                    onPrimary: Colors.black, // selected text color
                    onSurface: Colors.amberAccent, // default text color
                    primary: Colors.amberAccent // circle color
                    ),
                dialogBackgroundColor: Colors.black54,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand'),
                        primary: Colors.amber, // color of button's letters
                        backgroundColor: Colors.black54, // Background color
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50))))),
            child: child!,
          );
        });
    return date;
  }
}

class _DueDateInput extends StatelessWidget {
  const _DueDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.dueDateInput != current.dueDateInput,
      builder: (context, state) {
        final bloc = context.read<WaterSupplyEditBloc>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextInput(
              label: S.of(context).label_license_expired_date,
              controller: context.read<WaterSupplyEditBloc>().dueDateController,
              onTap: () async {
                final date = await _pickDate(context);
                if (date != null) {
                  bloc.add(DueDateChanged(date));
                }
              },
              readOnly: true,
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
              // errorText: _handleErrorText(context, state),
            ),
          ],
        );
      },
    );
  }

  // String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
  //   if (!state.dueDateInput.invalid) return null;
  //   switch (state.dueDateInput.error) {
  //     case DOCInputValidationError.empty:
  //       return 'សូមជ្រើសរើសថ្ងៃ ខែ ឆ្នាំផុតកំណត់អាជ្ញាបណ្ណ';
  //     default:
  //       return null;
  //   }
  // }

  Future<DateTime?> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate:
            context.read<WaterSupplyEditBloc>().state.dueDateInput.value ??
                DateTime.now(),
        firstDate: DateHelper.calendarFirstDate(),
        lastDate: DateHelper.calendarLastDate(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                    onPrimary: Colors.black, // selected text color
                    onSurface: Colors.amberAccent, // default text color
                    primary: Colors.amberAccent // circle color
                    ),
                dialogBackgroundColor: Colors.black54,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand'),
                        primary: Colors.amber, // color of button's letters
                        backgroundColor: Colors.black54, // Background color
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50))))),
            child: child!,
          );
        });
    return date;
  }
}

class _FilterInput extends StatelessWidget {
  const _FilterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.filterInput != current.filterInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).pool_filter,
          focusNode: bloc.filterFocus,
          controller: bloc.filterController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<FilterEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).pool_filter,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...FilterEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(FilterChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.filterInput.invalid) return null;
//   switch (state.filterInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសប្រព័ន្ធចម្រោះទឹក';
//     default:
//       return null;
//   }
// }
}

class _AirStationInput extends StatelessWidget {
  const _AirStationInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WaterSupplyEditBloc>();
    return BlocBuilder<WaterSupplyEditBloc, WaterSupplyEditState>(
      buildWhen: (previous, current) =>
          previous.airStationInput != current.airStationInput,
      builder: (context, state) {
        return MyTextInput(
          label: S.of(context).status_pipe,
          focusNode: bloc.airStationFocus,
          controller: bloc.airStationController,
          onTap: () async {
            final type = await DialogHelper.showAnimatedDialog<WellStatusEnum?>(
              animationType: DialogAnimationType.none,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, a1, a2) {
                return MySimpleDialog(
                  title: S.of(context).status_pipe,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...WellStatusEnum.values.map(
                          (status) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop(status);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            title: TextWidget(status.getDisplayText()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (type != null) {
              bloc.add(AirStationChanged(type));
            }
          },
          // errorText: _handleErrorText(context, state),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 18),
          readOnly: true,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

// String? _handleErrorText(BuildContext context, WaterSupplyEditState state) {
//   if (!state.airStationInput.invalid) return null;
//   switch (state.airStationInput.error) {
//     case WaterSupplyInputValidationError.empty:
//       return 'សូមជ្រើសរើសស្ថានភាពស្ថានីយ';
//     default:
//       return null;
//   }
// }
}

// class WaterSupplyEditManageView extends StatelessWidget {
//   const WaterSupplyEditManageView({Key? key}): super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: true,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: const [
//           Text('Parameter Code', style: TextStyle(fontWeight: FontWeight.bold),),
//           SizedBox(height: 15,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000010'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000020'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000030'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000040'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000050'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000060'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000070'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000080'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000090'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000100'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000110'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000120'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000130'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000140'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000150'),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: Text('PA000160'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WaterSupplyEditManageTextBox extends StatelessWidget {
//   const WaterSupplyEditManageTextBox({Key? key}): super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: true,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: const[
//           Text('Value', style: TextStyle(fontWeight: FontWeight.bold),),
//           SizedBox(height: 15,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           SizedBox(height: 5,),
//           SizedBox(
//             height: 50,
//             child: MyTextInput(
//               // errorText: _handleErrorText(context, state),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }