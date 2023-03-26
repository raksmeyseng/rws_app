import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/view_details/view/list_details.dart';
import 'package:rws_app/core/style/fonts/app_style.dart';
import 'package:rws_app/core/widgets/textbutton_icon.dart';

class DetailsWaterSupply extends StatefulWidget {
  final String title;
  const DetailsWaterSupply({Key? key, required this.title}) : super(key: key);

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
    // TODO: implement setState
    super.setState(fn);
    valueShowList = int.parse(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    final columns = ['ខេត្ត/រាជធានី', 'ស្រុក/ក្រុង', 'ឃុំ/សង្កាត់', 'ភូមិ', 'កាលបរិច្ឆេទបង្កើត', 'ប្រភេទ', 'បង្កើតដោយ', 'ស្ថានភាព', 'មើលលម្អិត'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              AddNewWaterManageSystem(
                onPress: (){},
                icon: Icons.add_circle_outlined,
                title: 'បង្កើតប្រពន្ធ័គ្រប់គ្រងទឹកថ្មី',

              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Show'),
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
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const Text('entries'),
                ],
              ),
              PaginatedDataTable(
                source: _data,
                columns: getColumns(columns),
                showFirstLastButtons: true,
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
    label: Text(column, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
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
        "ProvinceOrCapital": "ពោធិ៍សាត់",
        "DistrictOrCity": "ពោធិ៍សាត់",
        "CommuneOrSangkat": "ផ្ទះព្រៃ",
        "Village": "ចំការចេកជើង",
        "CreateDate": "2023-03-16 09:23:22",
        "Category": "អណ្ដូង $index",
        "CreatedBy": "de_ps",
        "Status": "Published",
        "Details": "Details"
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
      DataCell(Text(_data[index]['ProvinceOrCapital'].toString())),
      DataCell(Text(_data[index]["DistrictOrCity"])),
      DataCell(Text(_data[index]["CommuneOrSangkat"].toString())),
      DataCell(Text(_data[index]["Village"])),
      DataCell(Text(_data[index]["CreateDate"].toString())),
      DataCell(Text(_data[index]["Category"])),
      DataCell(Text(_data[index]["CreatedBy"].toString())),
      DataCell(
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            child: Container(
              padding: const EdgeInsets.all(5),
              color: const Color(0xFFFFC107),
              child: Text(_data[index]["Status"]),
            ),
          )
      ),
      const DataCell(
          ButtonView()
      ),
    ]);
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ListDetails()));
      },
      icon: const Icon(Icons.remove_red_eye_outlined, color: Color(0xFF007bff),),
      label: const Text('មើលលម្អិត', style: TextStyle(color: Color(0xFF007bff)),),
      style: TextButton.styleFrom( //<-- SEE HERE
        side: const BorderSide(width: 1.0, color: Color(0xFF007bff)),
      ),
    );
  }
}
