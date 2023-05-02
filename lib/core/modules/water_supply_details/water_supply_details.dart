import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/view/list_details.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/textbutton_icon.dart';

import '../../../config/routes/app_route.dart';

class DetailsWaterSupply extends StatefulWidget {
  final String id;
  const DetailsWaterSupply({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsWaterSupply> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DetailsWaterSupply> {
  final DataTableSource _data = MyData();

  String dropdownValue = '10';
  List<String> listDropDown = ['10', '25', '50', '100'];

  int valueShowList = 10;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    valueShowList = int.parse(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    final columns = [
      'លេខកូដសំនង់',
      'ខេត្ត/រាជធានី',
      'ស្រុក/ក្រុង',
      'ឃុំ/សង្កាត់',
      'ភូមិ',
      'កាលបរិច្ឆេទបង្កើត',
      'ប្រភេទ',
      'បង្កើតដោយ',
      'ស្ថានភាព',
      'មើលលម្អិត'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        title: TextWidget(
          widget.id,
          color: AppColor.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddNewWaterManageSystem(
              onPress: () {},
              icon: Icons.add_circle_outlined,
              title: 'បង្កើតថ្មី',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TextWidget('បង្ហាញ'),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton2(
                          isExpanded: true,
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          buttonHeight: 30,
                          buttonWidth: 100,
                          itemHeight: 30,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: dropdownValue,
                          items: listDropDown.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: TextWidget(
                                value,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const TextWidget('entries'),
                ],
              ),
              PaginatedDataTable(
                source: _data,
                columns: getColumns(columns),
                // showFirstLastButtons: true,
                dragStartBehavior: DragStartBehavior.start,
                columnSpacing: 50,
                horizontalMargin: 10,
                rowsPerPage: valueShowList,
                showCheckboxColumn: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // view column title
  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: TextWidget(column),
            onSort: onSort,
          ))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    // if (columnIndex == 0) {
    //   users.sort((user1, user2) =>
    //       compareString(ascending, user1.firstName, user2.firstName));
    // } else if (columnIndex == 1) {
    //   users.sort((user1, user2) =>
    //       compareString(ascending, user1.lastName, user2.lastName));
    // } else if (columnIndex == 2) {
    //   users.sort((user1, user2) =>
    //       compareString(ascending, '${user1.age}', '${user2.age}'));
    // }

    setState(() {
      // this.sortColumnIndex = columnIndex;
      // this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      87,
      (index) => {
            'ConstructionCode': '1',
            'ProvinceOrCapital': 'ពោធិ៍សាត់',
            'DistrictOrCity': 'ពោធិ៍សាត់',
            'CommuneOrSangkat': 'ផ្ទះព្រៃ',
            'Village': 'ចំការចេកជើង',
            'CreateDate': '2023-03-16 09:23:22',
            'Category': 'អណ្ដូង $index',
            'CreatedBy': 'de_ps',
            'Status': 'Published',
            'Details': 'Details'
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(TextWidget(_data[index]['ConstructionCode'].toString())),
      DataCell(TextWidget(_data[index]['ProvinceOrCapital'].toString())),
      DataCell(TextWidget(_data[index]['DistrictOrCity'])),
      DataCell(TextWidget(_data[index]['CommuneOrSangkat'].toString())),
      DataCell(TextWidget(_data[index]['Village'])),
      DataCell(TextWidget(_data[index]['CreateDate'].toString())),
      DataCell(TextWidget(_data[index]['Category'])),
      DataCell(TextWidget(_data[index]['CreatedBy'].toString())),
      DataCell(ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: const Color(0xFFFFC107),
          child: TextWidget(_data[index]['Status']),
        ),
      )),
      const DataCell(ButtonView()),
    ]);
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
/*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListDetails(),
          ),
        );
        */
        context.goNamed(
          AppRoute.waterSupplyViewDetail,
          extra: {
            'id': 0,
          },
        );
      },
      icon: Icon(
        Icons.remove_red_eye_outlined,
        color: Theme.of(context).primaryColor,
      ),
      label: const TextWidget('មើលលម្អិត'),
      style: TextButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
