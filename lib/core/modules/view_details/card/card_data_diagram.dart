import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class CardDataDiagram extends StatelessWidget {
  const CardDataDiagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Diagrams(),
        ),
      ),
    );
  }
}

class Diagrams extends StatelessWidget {
  const Diagrams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StoreDiagrams> namelist = [];
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000010',
        parameters: 'អឺកូលី E.coli or thermotolerant coliform',
        unit: 'CFU or MPN/100ml',
        waterQuality: '0',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000020',
        parameters: 'អាសេនិក Arsenic (As)',
        unit: 'mg/l',
        waterQuality: '< 0.03',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000030',
        parameters: 'សំណល់ក្លរ (Free Chlorine)',
        unit: 'mg/l',
        waterQuality: '0.2 - 0.5',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000040',
        parameters: 'ក្លរួ Chloride (Cl-)',
        unit: 'mg/l',
        waterQuality: '< 250',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000050',
        parameters: 'ភ្លុយអរួ Fluoride (F-)',
        unit: 'mg/l',
        waterQuality: '< 1.5',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000060',
        parameters: 'ដែក Iron (Fe)',
        unit: 'mg/l',
        waterQuality: '< 0.3',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000070',
        parameters: 'អាលុយមីញ៉ូម Aluminium (AL)',
        unit: 'mg/l',
        waterQuality: '< 0.2',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000080',
        parameters: 'ភាពរឹងសរុប (Total Hardness in CaCO3 )',
        unit: 'mg/l',
        waterQuality: '< 400',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000090',
        parameters: 'សំណ (Pb)',
        unit: 'mg/l',
        waterQuality: '< 0.01',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000100',
        parameters: 'ម៉ង់កាណែស Manganese (Mn)',
        unit: 'mg/l',
        waterQuality: '< 0.3',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000110',
        parameters: 'នីត្រាត Nitrate (NO3- )',
        unit: 'mg/l',
        waterQuality: '< 50',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000120',
        parameters: 'នីទ្រីត Nitrite (NO2-)',
        unit: 'mg/l',
        waterQuality: '< 3',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000130',
        parameters: 'អាម៉ូញ៉ាក់ (NH3 )',
        unit: 'mg/l',
        waterQuality: '< 1.5',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000140',
        parameters: 'សារធាតុរឹង​រលាយសរុប (TDS)',
        unit: 'mg/l',
        waterQuality: '< 800',
        price: 0.00));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000150',
        parameters: 'pH',
        unit: 'n/a',
        waterQuality: '6.5-8.5',
        price: 0.0));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000160',
        parameters: 'ភាពល្អក់ (Turbidity)',
        unit: 'NTU',
        waterQuality: '8',
        price: 0.00));

    return Column(
      children: [
        // title details
        Table(
          border: TableBorder.all(
            width: 0.5,
            color: AppColor.black,
          ),
          defaultColumnWidth: const FixedColumnWidth(150.0),
          children: const [
            TableRow(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: TextWidget(
                  'ប៉ារាម៉ែត្រ កូដ',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextWidget(
                  'ប៉ារាម៉ែត្រ',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextWidget(
                  'ឯកតា',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextWidget(
                  'ស្តង់ដាគុណភាពទឹកផឹក?',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextWidget(
                  'តម្លៃ',
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ],
        ),
        // view details
        Table(
          border: TableBorder.all(
            width: 0.5,
            color: AppColor.black,
          ),
          defaultColumnWidth: const FixedColumnWidth(150.0),
          children: namelist.map((diagram) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextWidget(diagram.parameterCode)),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextWidget(diagram.parameters),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextWidget(diagram.unit),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextWidget(diagram.waterQuality),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextWidget(
                      diagram.price.toString(),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}

class StoreDiagrams {
  StoreDiagrams(
      {required this.parameterCode,
      required this.parameters,
      required this.unit,
      required this.waterQuality,
      required this.price});

  String parameterCode;
  String parameters;
  String unit;
  String waterQuality;
  double price;
}
